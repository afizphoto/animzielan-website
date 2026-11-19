import Site from '../../lib/site';

export const metadata = {title:'Website Manager',robots:{index:false,follow:false}};

export default function Page() {
  return <Site page={'admin'}/>;
}
