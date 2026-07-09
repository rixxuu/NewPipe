        <T> Single<T> pleaseWait(final Single<T> single) {
            // 'abuse' ambWith() here to cancel the toast for us when the wait is over
            return single.ambWith(Single.create(emitter -> getActivityContext().ifPresent(context ->
                    context.runOnUiThread(() -> {
                        // Getting the stream info usually takes a moment
                        // Notifying the user here to ensure that no confusion arises
                        emitter.setCancellable(() -> {});
            }))));
        }
