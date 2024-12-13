export default {
	async fetch(request, env, ctx): Promise<Response> {
        const resp = await fetch(request);

        if (resp.status == 403) {
            const redirect = new Response(resp.body, {
                ...resp,
                status: 301,
                statusText: "Moved Permanently"
            });

            redirect.headers.set("Location", `https://${env.HOST}/404.html`);

            return redirect;
        }

		return resp;
	},
} satisfies ExportedHandler<Env>;
