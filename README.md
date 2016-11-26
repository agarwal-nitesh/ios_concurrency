Concurrency in iOS using GCD (Grand Central Dispatch):

	Dispatch Queues:
		- Serial Queues
		- Concurrent Queues

	Serial Queues:
		Create:
			queue = dispatch_create("com.nitesh.serialqueue", DISPATCH_QUEUE_SERIAL)

		Execute:
			dispatch_async(queue, task)

	Concurrent Queues:
		Create:
			queue = dispatch_create("com.nitesh.concurrentqueue", DISPATCH_QUEUE_CONCURRENT)
		Execute:
			dispatch_async(queue, task)

	By default iOS provides 1 serial and 4 concurrent queues.
		- Serial queue - dispatch_get_main_queue()
		- Concurrent queues - dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
			DISPATCH_QUEUE_PRIORITY_HIGH
			DISPATCH_QUEUE_PRIORITY_LOW
			DISPATCH_QUEUE_PRIORITY_BACKGROUND

	Execution of tasks can also be done via dispatch_group_async. This lets you wait for concurrent tasks completion and notify concurrent tasks completion.
		
