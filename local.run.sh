
# set ups
export JOB_NAME="mnist_ae_$(date +%Y%m%d_%H%M%S)"
export JOB_DIR="./tmp/local_train_$JOB_NAME/"

echo ""
echo "job dir =$JOB_DIR"
echo "job name= $JOB_NAME"

mkdir -p $JOB_DIR

gcloud ml-engine local train \
  --module-name trainer.task \
  --package-path ./trainer/ \
  -- \
  --job-dir $JOB_DIR \
  --job_id $JOB_NAME \
  --use_transposed_conv \
  --score_metric "mse" \
  --loss "binary_crossentropy" \
  --lr 0.001 \
  --lr_decay 0.001 \
  --optimizer_name "adam" \
  --n_epochs 3 \
  --patience 5

