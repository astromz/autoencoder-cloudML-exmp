
# set ups
export JOB_NAME="mnist_AE_$(date +%Y%m%d_%H%M%S)"

# Change this to your actual project name and bucket name
export BUCKET_NAME=my-project/my_bucket

export JOB_DIR=gs://$BUCKET_NAME/$JOB_NAME/
export REGION=us-east1

echo ""
echo "job dir =$JOB_DIR"
echo "job name= $JOB_NAME"


gcloud ml-engine jobs submit training $JOB_NAME \
  --module-name trainer.task \
  --job-dir $JOB_DIR \
  --package-path ./trainer/ \
  --region $REGION \
  --config=trainer/cloudml-gpu.yaml \
  -- \
  --job_id $JOB_NAME \
  --use_transposed_conv \
  --score_metric "mse" \
  --loss "binary_crossentropy" \
  --lr 0.001 \
  --lr_decay 0.001 \
  --optimizer_name "adam" \
  --n_epochs 100 \
  --patience 5 \
  --pool_method "average" \
  --batch_norm_before_activation
