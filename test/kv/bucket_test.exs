defmodule KV.BucketTest do
    use ExUnit.Case, async: true
    # Use async only if the test case
    # does not rely on global values or IO

    setup do
        {:ok, bucket} = KV.Bucket.start_link([])
        %{bucket: bucket}
    end

    test "stores values by key", %{bucket: bucket} do
        assert KV.Bucket.get(bucket, "milk") == nil

        KV.Bucket.put(bucket, "milk", 3)
        assert KV.Bucket.get(bucket, "milk") == 3
    end
end
