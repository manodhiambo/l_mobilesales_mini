import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A simple network status provider using Riverpod
/// true = online, false = offline
final networkStatusProvider = StateProvider<bool>((ref) => true);
