- we have some high utilized pods which are using exactly all CPUs that we define in the requests
- some pods with configured limit

The high utilized pods will used all CPUs from node and the rest of pods will be throttled and will not be able to use all CPUs that we define in the limit.