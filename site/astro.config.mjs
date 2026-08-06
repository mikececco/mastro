// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// TODO: sostituire con il dominio definitivo una volta registrato (.it dedicato).
const SITE = 'https://mastrofisco.it';

export default defineConfig({
  site: SITE,
  integrations: [sitemap()],
});
