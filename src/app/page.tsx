import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

const HomePage = () => {
  return (
    <div className="rounded-xl border border-red-500 bg-black p-5">
      <h1 className="p-5 text-red-500">Hello World!</h1>
      <Button> ok </Button>
      <Input />
    </div>
  );
};

export default HomePage;
