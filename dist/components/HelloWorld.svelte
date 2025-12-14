<script lang="ts">
	interface Props {
		message: string;
	}

	let { message = 'World, World' }: Props = $props();
</script>

<div>
	{message}
</div>
