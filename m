Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBzOK-0007UW-3y
	for mharc-qemu-rust@gnu.org; Fri, 15 Nov 2024 11:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNn-0006bU-6B
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNk-0002Nf-E6
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731688875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9drXR6Ude9Syf7XBgbJFTV9jiXiqgiqWNTd79QJqvw=;
 b=TToPk5bJq1tPRxkD2xvjp6c8HWmKXmIzZEkkm2QFjr2pSzSNxMsLqfsHqKIrF7cLEf7Kce
 7BG6kffdzDTTAzQEzpDezUYHSPYnylVQhDNCnEOLK3DsU4Ecnp5vQ/+4d45mJNaSO0SuNV
 Ezw8cyFuEsUC8OZQhbM7LUhKlIrd1yI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-AZeNgZM-McKVsUdizYiiWQ-1; Fri, 15 Nov 2024 11:41:14 -0500
X-MC-Unique: AZeNgZM-McKVsUdizYiiWQ-1
X-Mimecast-MFC-AGG-ID: AZeNgZM-McKVsUdizYiiWQ
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-539f49f23ddso582069e87.1
 for <qemu-rust@nongnu.org>; Fri, 15 Nov 2024 08:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688873; x=1732293673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9drXR6Ude9Syf7XBgbJFTV9jiXiqgiqWNTd79QJqvw=;
 b=ggDA9Y9Xq4jsSIfDT793X0lASMfvJE3JneR7m0fxVxTl0RWjL7MD59dvU5VpcrM843
 ipU6t84QwiTkPh0TzFWMQZ+tvO6qgAysHWCLKUNvAo/ylCqyeyNEdYNm4oikVnfLPDTu
 7/bA5fsU85CbmmIUf6w/sjddaVGHxDC+7VWM5TqyGDaAli8KNJG8hFtl4uBrri8tKs7c
 kr7G+Ko0etm3rk0IRjaUwT7g3MHTSTkd9duDTGMQQOOZmQpB1jDMSNSq/t6BUHseehvJ
 DPBysTgDFgrVPRX5EVRSZff8LW4q7ogOS8CXZTVSLiIlf+ELwXZ+Og4RAQA5X2LLQHsn
 oo/g==
X-Gm-Message-State: AOJu0YxgOeZPM4qQd68EQqZxSjv0ThRNN2xMsK2SAB+2YWUqtL8wXd7q
 lB/SxPGTarm/lkYA5Kadj+jNf5o2ueo3moOSyIiamXY2UT/naAyg06u/S7CkCIn8Hb4jmm2ofk/
 cF9YCRfK0ZRWLV8OTdMcAX0KszxFOBbwo/2pEwXGqwxG2z4VCU2U=
X-Received: by 2002:a05:6512:a8b:b0:53d:a4ff:31d7 with SMTP id
 2adb3069b0e04-53dab3bf5a5mr1798637e87.40.1731688872681; 
 Fri, 15 Nov 2024 08:41:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBxdEuDpU02hegQikxa2pwFvauIp8Gy2nDC9GIpzg2YewMmP3fd8pNPe7EWiYWovEJeeHCLQ==
X-Received: by 2002:a05:6512:a8b:b0:53d:a4ff:31d7 with SMTP id
 2adb3069b0e04-53dab3bf5a5mr1798622e87.40.1731688872258; 
 Fri, 15 Nov 2024 08:41:12 -0800 (PST)
Received: from [192.168.10.3] ([151.49.84.243])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab78881sm58647175e9.13.2024.11.15.08.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:41:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, berrange@redhat.com, junjie.mao@hotmail.com,
 manos.pitsidianakis@linaro.org, kwolf@redhat.com
Subject: [PATCH 11/12] rust: ci: add job that runs Rust tools
Date: Fri, 15 Nov 2024 17:40:24 +0100
Message-ID: <20241115164025.1917618-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115163944.1917393-1-pbonzini@redhat.com>
References: <20241115163944.1917393-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sOlxGC1AQtPNrpWKvNMwhMyT-eYMhIejlpmE_YhUIeY_1731688873
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.12,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.658,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Nov 2024 16:41:22 -0000

Code checks, as well as documentation generation, are not yet tied
to "make check" because they need new version of the Rust toolchain
(even nightly in the case of "rustfmt").  Run them in CI using the
existing nightly-Rust container.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/static_checks.yml                | 23 +++++++++++++++++++
 .../dockerfiles/fedora-rust-nightly.docker    |  4 ++++
 tests/lcitool/refresh                         |  4 ++++
 3 files changed, 31 insertions(+)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index ad9f426a52f..f6f22875265 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -46,3 +46,26 @@ check-python-tox:
     QEMU_JOB_OPTIONAL: 1
   needs:
     job: python-container
+
+check-rust-tools-nightly:
+  extends: .base_job_template
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/fedora-rust-nightly:$QEMU_CI_CONTAINER_TAG
+  script:
+    - source scripts/ci/gitlab-ci-section
+    - section_start test "Running Rust code checks"
+    - cd build
+    - pyvenv/bin/meson devenv -w ../rust ${CARGO-cargo} fmt --check
+    - make clippy
+    - make rustdoc
+    - section_end test
+  variables:
+    GIT_DEPTH: 1
+  needs:
+    - job: build-system-fedora-rust-nightly
+      artifacts: true
+  artifacts:
+    when: on_success
+    expire_in: 2 days
+    paths:
+      - rust/target/doc
diff --git a/tests/docker/dockerfiles/fedora-rust-nightly.docker b/tests/docker/dockerfiles/fedora-rust-nightly.docker
index 9180c8b5222..a8e4fb279a7 100644
--- a/tests/docker/dockerfiles/fedora-rust-nightly.docker
+++ b/tests/docker/dockerfiles/fedora-rust-nightly.docker
@@ -155,6 +155,7 @@ ENV PYTHON "/usr/bin/python3"
 RUN dnf install -y wget
 ENV RUSTUP_HOME=/usr/local/rustup CARGO_HOME=/usr/local/cargo
 ENV RUSTC=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustc
+ENV CARGO=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/cargo
 RUN set -eux && \
   rustArch='x86_64-unknown-linux-gnu' && \
   rustupSha256='6aeece6993e902708983b209d04c0d1dbb14ebb405ddb87def578d41f920f56d' && \
@@ -165,10 +166,13 @@ RUN set -eux && \
   ./rustup-init -y --no-modify-path --profile default --default-toolchain nightly --default-host ${rustArch} && \
   chmod -R a+w $RUSTUP_HOME $CARGO_HOME && \
   /usr/local/cargo/bin/rustup --version && \
+  /usr/local/cargo/bin/rustup run nightly cargo --version && \
   /usr/local/cargo/bin/rustup run nightly rustc --version && \
+  test "$CARGO" = "$(/usr/local/cargo/bin/rustup +nightly which cargo)" && \
   test "$RUSTC" = "$(/usr/local/cargo/bin/rustup +nightly which rustc)"
 ENV PATH=$CARGO_HOME/bin:$PATH
 RUN /usr/local/cargo/bin/rustup run nightly cargo install bindgen-cli
+RUN $CARGO --list
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 51012783c0f..6720516b942 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -121,6 +121,7 @@ fedora_rustup_nightly_extras = [
     "RUN dnf install -y wget\n",
     "ENV RUSTUP_HOME=/usr/local/rustup CARGO_HOME=/usr/local/cargo\n",
     "ENV RUSTC=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustc\n",
+    "ENV CARGO=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/cargo\n",
     "RUN set -eux && \\\n",
     "  rustArch='x86_64-unknown-linux-gnu' && \\\n",
     "  rustupSha256='6aeece6993e902708983b209d04c0d1dbb14ebb405ddb87def578d41f920f56d' && \\\n",
@@ -131,10 +132,13 @@ fedora_rustup_nightly_extras = [
     "  ./rustup-init -y --no-modify-path --profile default --default-toolchain nightly --default-host ${rustArch} && \\\n",
     "  chmod -R a+w $RUSTUP_HOME $CARGO_HOME && \\\n",
     "  /usr/local/cargo/bin/rustup --version && \\\n",
+    "  /usr/local/cargo/bin/rustup run nightly cargo --version && \\\n",
     "  /usr/local/cargo/bin/rustup run nightly rustc --version && \\\n",
+    '  test "$CARGO" = "$(/usr/local/cargo/bin/rustup +nightly which cargo)" && \\\n',
     '  test "$RUSTC" = "$(/usr/local/cargo/bin/rustup +nightly which rustc)"\n',
     'ENV PATH=$CARGO_HOME/bin:$PATH\n',
     'RUN /usr/local/cargo/bin/rustup run nightly cargo install bindgen-cli\n',
+    'RUN $CARGO --list\n',
 ]
 
 ubuntu2204_bindgen_extras = [
-- 
2.47.0


