IMAGE = psunday/fake-backend:travis-ci

image:
	docker build -t $(IMAGE) .

run:
	docker run -d --name=student-list-api -p 5000:5000 -v ${PWD}/simple_api/student_age.json:/data/student_age.json $(IMAGE)
	# To let the container start before run test
	sleep 5

clean:
	docker rm -vf  fake-backend

push-image:
	docker push $(IMAGE)

.PHONY: image run test clean push-image
