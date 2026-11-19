import Site from '../../lib/site';

export const metadata = {title:'About',alternates:{canonical:'/about'}};

export default function Page() {
  return <Site page={'about'}/>;
}
