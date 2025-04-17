import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:async';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  WebSocketChannel? _channel;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;
  bool _isConnected = false;
  int _reconnectAttempts = 0;
  static const int maxReconnectAttempts = 5;
  static const Duration reconnectDelay = Duration(seconds: 5);
  static const Duration heartbeatInterval = Duration(seconds: 10);

  final wsUrl = 'ws://localhost:8080';

  static int _notificationCount = 0;
  static final List<Function(int)> _listeners = [];

  static void addListener(Function(int) listener) {
    _listeners.add(listener);
  }

  static void removeListener(Function(int) listener) {
    _listeners.remove(listener);
  }

  static void increment() {
    _notificationCount++;
    _notifyListeners();
  }

  static void reset() {
    _notificationCount = 0;
    _notifyListeners();
  }

  static void _notifyListeners() {
    for (var listener in _listeners) {
      listener(_notificationCount);
    }
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(heartbeatInterval, (timer) {
      if (_isConnected && _channel != null) {
        try {
          _channel!.sink.add('ping');
        } catch (e) {
          _handleDisconnect();
        }
      }
    });
  }

  void _handleDisconnect() {
    setState(() {
      _isConnected = false;
    });
    _heartbeatTimer?.cancel();
    _channel?.sink.close();
    _startReconnect();
  }

  void _startReconnect() {
    if (_reconnectAttempts >= maxReconnectAttempts) {
      print('Max reconnection attempts reached');
      return;
    }

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(reconnectDelay, () {
      _reconnectAttempts++;
      _connectWebSocket();
    });
  }

  void _connectWebSocket() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      
      _channel!.stream.listen(
        (message) {
          setState(() {
            increment();
            _isConnected = true;
            _reconnectAttempts = 0;
          });
        },
        onError: (error) {
          print('WebSocket error: $error');
          _handleDisconnect();
        },
        onDone: () {
          print('WebSocket connection closed');
          _handleDisconnect();
        },
      );

      _startHeartbeat();
    } catch (e) {
      print('Failed to connect: $e');
      _handleDisconnect();
    }
  }

  @override
  void initState() {
    super.initState();
   // _connectWebSocket();
   // addListener(_onNotificationCountChanged);
  }

  @override
  void dispose() {
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    removeListener(_onNotificationCountChanged);
    super.dispose();
  }

  void _onNotificationCountChanged(int count) {
    setState(() {});
  }

  Widget _buildNotificationWithBadge() {
    return IconButton(
      icon: Badge.count(
        count: _notificationCount,
        child: const Icon(Icons.notifications,),
      ),
      onPressed: () {
        reset();
      },
    );
  }

  Widget _buildNotificationWithoutBadge() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.notifications,), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return _notificationCount > 0
        ? _buildNotificationWithBadge()
        : _buildNotificationWithoutBadge();
  }
}
