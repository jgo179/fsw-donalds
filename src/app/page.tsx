import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

const HomePage = () => {
  return (
    <div className="p-5 border border-red-500 rounded-xl">
      <h1 className="text-red-500">Hello World!</h1>
      <Button> ok </Button>
      <Input />
    </div>
  );
};

export default HomePage;
