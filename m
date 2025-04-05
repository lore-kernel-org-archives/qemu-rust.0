Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u10Pr-00077U-I1
	for mharc-qemu-rust@gnu.org; Sat, 05 Apr 2025 06:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Pq-00076J-2O
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Po-0005s6-Da
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743847575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHssbMwpp04AcS81wEaBlM+7BT95pXZcAectm5uN2H0=;
 b=U31MkZnsw8jj+WWDiGk7ib1WpAT/RIaiBPuF/d0AKaXezVAJOs95uqWSKmVuScHD9KJkTC
 9V0pt7CEeWbSC/vK4G1hl6SMBKDfKp9ZdTZSiunNSM8qFYJ5goHvp8W3NJe0+/zpW8uZAQ
 Hy9H0bgoYd7XGIXkI/anrDr8PbjhE3I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-PGVu5zCTMDWLgdsJBSioZw-1; Sat, 05 Apr 2025 06:06:14 -0400
X-MC-Unique: PGVu5zCTMDWLgdsJBSioZw-1
X-Mimecast-MFC-AGG-ID: PGVu5zCTMDWLgdsJBSioZw_1743847573
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so15650895e9.2
 for <qemu-rust@nongnu.org>; Sat, 05 Apr 2025 03:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743847571; x=1744452371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHssbMwpp04AcS81wEaBlM+7BT95pXZcAectm5uN2H0=;
 b=QVngGO6yUaSlpNarJ1Yx6Lxu8vte3zzwwLyHgM3hEojnHDrpg3Ju0+O1QLxHCIykJZ
 cjudHtAPa8kNCFAvBIy1iOXfjx9nuixVsL+z1STxDI6nTcrrhurCgOWqD3FeUk4kvLe/
 Qsn6Owzq3pT7HyjXgSdjBEXrGnbeCv8R6zjg4gyYnmGtmlRO35jn0fAwllVPgZsxEf/6
 kMDAonzcvl0i9SCcUJhkLyXLhUZlTXvIJqIyeo8K9NDWn/UAD4Wz1ASLe8wkgx2mH/s3
 c8awilq4/IvE04XVERnO+LXAyZyoJ2kceWm9iezhlRkVLfT5Tt8UeQ/v56qgywv8ArcY
 78ow==
X-Gm-Message-State: AOJu0YwyKCV/6bKwHufgPOFZHvsdFOwWl+ijH07royGjEskYpkYIrEqI
 HmhvG1Ncnd2aEqIjs9otwlXanBwvMWmSxPl7EqzgfOnmAgwBd6TIMxo6d3Tpo/y4Ei/LUgCu9sU
 xOk6iCral33gCpUcSu/ZtUMO5Ga8fz6Pkku+3yWmCe36rywm8THnDpmR6rGU=
X-Gm-Gg: ASbGncvZtC4l3bSjfLZoSwV8KuME0IA8AcpfvzxE5q7db5EFFT4tBZenUa1GaUv+Gtr
 XQqNyd39DZ79xy5EqkvHsEr+c6mCwxnRW8dYdTotw+7uWCTlGBIi9ZpCBiHatSlZGLopxK89K8I
 ZFiCBZpDJm4wEvgFWLp/n3OYvSSScrRjSAZNGrxChZuOZT7gFLh4KkpgDPsXQf4OuQaA9ZTr3Gt
 pEiEodzHW2YAtCi4vacueDYfmEcUv00enDwfp4LsqVGyJHF3hDqg44czW0vxv1ouQ7xY/F3hMW9
 f+pG6eonF7EC2gdyxA==
X-Received: by 2002:a05:600c:1c92:b0:43d:ed:ad07 with SMTP id
 5b1f17b1804b1-43ecfa05104mr46700015e9.29.1743847571076; 
 Sat, 05 Apr 2025 03:06:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxf0T+zpLzJT8Lr0bxjY4zTHmYO+ogOfR9E8xOSSG+22v7Jm8V9b72TYJiVtRUcrLydxtU9Q==
X-Received: by 2002:a05:600c:1c92:b0:43d:ed:ad07 with SMTP id
 5b1f17b1804b1-43ecfa05104mr46699865e9.29.1743847570744; 
 Sat, 05 Apr 2025 03:06:10 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.96.77])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec17b0dbesm71991405e9.33.2025.04.05.03.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 03:06:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/3] rust: add qemu-api doctests to "meson test"
Date: Sat,  5 Apr 2025 12:06:02 +0200
Message-ID: <20250405100603.253421-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405100603.253421-1-pbonzini@redhat.com>
References: <20250405100603.253421-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YLZ_9wsROJQUNH8mGSF-MwWOOoK4sI-Q3l-5TxSBBmM_1743847573
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.028,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Sat, 05 Apr 2025 10:06:18 -0000

Doctest are weird.  They are essentially integration tests, but they're
"ran" by executing rustdoc --test, which takes a compiler-ish
command line.  This is supported by Meson 1.8.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/buildtest.yml |  5 -----
 rust/qemu-api/meson.build | 11 +++++++++++
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 00f4bfcd9f3..088d5683c88 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -131,12 +131,7 @@ build-system-fedora-rust-nightly:
     IMAGE: fedora-rust-nightly
     CONFIGURE_ARGS: --disable-docs --enable-rust --enable-strict-rust-lints
     TARGETS: aarch64-softmmu
-    MAKE_CHECK_ARGS: check-build
-  after_script:
-    - source scripts/ci/gitlab-ci-section
-    - section_start test "Running Rust doctests"
-    - cd build
-    - pyvenv/bin/meson devenv -w ../rust ${CARGO-cargo} test --doc -p qemu_api
+    MAKE_CHECK_ARGS: check-build check-doc
 
   allow_failure: true
 
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 8fa41c0a95e..ede6e14e5e0 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -53,6 +53,17 @@ rust.test('rust-qemu-api-tests', _qemu_api_rs,
 qemu_api = declare_dependency(link_with: [_qemu_api_rs],
   dependencies: [qemuutil_rs, qemu_api_macros, qom, hwcore, chardev, migration])
 
+# Doctests are essentially integration tests, so they need the same "depends" as
+# below and cannot be run with "cargo test --doc".  Developer tools are only
+# supported for versions 1.74.0 or newer of Rust.
+if rustc.version().version_compare('>=1.74.0')
+  rust.doctest('rust-qemu-api-doctests',
+       _qemu_api_rs,
+       protocol: 'rust',
+       dependencies: qemu_api,
+       suite: ['doc', 'rust'])
+endif
+
 test('rust-qemu-api-integration',
     executable(
         'rust-qemu-api-integration',
-- 
2.49.0


