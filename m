Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t9TTy-0003aZ-9o
	for mharc-qemu-rust@gnu.org; Fri, 08 Nov 2024 13:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t9TTw-0003Zv-49
 for qemu-rust@nongnu.org; Fri, 08 Nov 2024 13:13:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t9TTt-0003Z1-1T
 for qemu-rust@nongnu.org; Fri, 08 Nov 2024 13:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731089591;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+zJrvTg0DM+h0x5eQKrDGa6QcN0PUbRmU4Tf2yYDGT8=;
 b=OyZV1wFO6uqW1DYtdwMfDlhDmmCEUDyoBhpnlD9/8KBfeSfNqDWCwbGh/2HsF3woH9jVDy
 QCPwlp8YNrEqTtsJH4azQWz3iJxNAVOFejvw4i/2MvG+8lD2D9BwVPlIek3ejF4KepX6JR
 7B2HFLwFAbvk3rRDJw5QV8wE0HIqrt8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-_8HaSwJ-MvWftK0WPFRS7g-1; Fri,
 08 Nov 2024 13:13:08 -0500
X-MC-Unique: _8HaSwJ-MvWftK0WPFRS7g-1
X-Mimecast-MFC-AGG-ID: _8HaSwJ-MvWftK0WPFRS7g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 855341955D55; Fri,  8 Nov 2024 18:13:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.70])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B68DB300019E; Fri,  8 Nov 2024 18:13:03 +0000 (UTC)
Date: Fri, 8 Nov 2024 18:12:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, manos.pitsidianakis@linaro.org, kwolf@redhat.com,
 junjie.mao@hotmail.com, zhao1.liu@intel.com, qemu-rust@nongnu.org
Subject: Re: [RFC PATCH 11/11] rust: ci: add job that runs Rust tools
Message-ID: <Zy5UjQDWjYa9WtR6@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241108180139.117112-1-pbonzini@redhat.com>
 <20241108180139.117112-12-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108180139.117112-12-pbonzini@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Nov 2024 18:13:17 -0000

On Fri, Nov 08, 2024 at 07:01:39PM +0100, Paolo Bonzini wrote:
> Code checks, as well as documentation generation, are not yet tied
> to "make check" because they need new version of the Rust toolchain
> (even nightly in the case of "rustfmt").  Run them in CI using the
> existing nightly-Rust container.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.d/buildtest-template.yml                | 14 ++++++++++++++
>  .gitlab-ci.d/buildtest.yml                         | 14 ++++++++++++++
>  .../docker/dockerfiles/fedora-rust-nightly.docker  |  4 ++++
>  tests/lcitool/refresh                              |  4 ++++
>  4 files changed, 36 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 39da7698b09..612e968ff19 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -79,6 +79,20 @@
>      - $MAKE NINJA=":" $MAKE_CHECK_ARGS
>      - section_end test
>  
> +.rust_test_job_template:
> +  extends: .base_job_template
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
> +  script:
> +    - source scripts/ci/gitlab-ci-section
> +    - section_start test "Running Rust code checks"
> +    - cd build
> +    - pyvenv/bin/meson devenv -w ../rust ${CARGO-cargo} fmt --check
> +    - make clippy
> +    - pyvenv/bin/meson devenv -w ../rust ${CARGO-cargo} doc --no-deps
> +    - pyvenv/bin/meson devenv -w ../rust ${CARGO-cargo} test --doc
> +    - section_end test
> +

I'd suggest that the static checks "fmt" and "doc" should be separated
from the dynamic (unit test) check in  "tests", and that the former
should be in a job defined in the static-checks.yml file.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


