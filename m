Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJxiz-0005hB-97
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 13:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxiv-0005fJ-Lf
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxit-0006gu-UT
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748365459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8BpKjEJltmzcm/OLNaNl+hh0ixQXBWzKCZWpkn3gDY=;
 b=N3tFbwR80+5tWsr+hyYmjwDXcTjuzpcLGmVcXp/zsjbtnm9N1fsTmUu6EHNE7cIt4O/1tv
 VUiAWCWGHBhE0p/vCjBRg9sR7rrykUmJat8zGeTjsU1IlNm5dnAe/HiH7qQNPBBdoUJocV
 uPvm7PO8ihOI+uHPHnAxbxmT8yD4HAE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-nyItGZqYO9uuhmd8D_V0LA-1; Tue, 27 May 2025 13:04:17 -0400
X-MC-Unique: nyItGZqYO9uuhmd8D_V0LA-1
X-Mimecast-MFC-AGG-ID: nyItGZqYO9uuhmd8D_V0LA_1748365456
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ad88ac202c0so4113766b.1
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 10:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365455; x=1748970255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8BpKjEJltmzcm/OLNaNl+hh0ixQXBWzKCZWpkn3gDY=;
 b=Oy5P+v3EM5Y2gayEExOr89HGwfF/l6V0nxwN8QZIdNTqaH+jbbrtzPOHcOpqYQtviE
 LMzRB3mB5uUZcNPsgbnYAAKACWnFmE1XCGcv7IWUjehGSJEhqj8ZwrKJ7zI/kOdma7Ta
 0nhoo2tNjEEfit7V08/TYW0dWczusOjl5ysS4Kxh0PpDBMwZkzY9jGH1GqrWIxXBMq1T
 Mcy4NBR3boLDr0/NtwzRiLyBbfNuPbD3hURz2XRwULGOdsZMk85mOe9pgukjlPlAUqc1
 16wTPwqXMMJZl3crEl2rKtH9Pw8bk1TqFGoRArWQy3Nyum1BugdWlsRln3dF7kRE/OQo
 GSGw==
X-Gm-Message-State: AOJu0YzQ14qxi427/xAKffvy7fMdtaGcAOCOmOBJ+nNS3lZy1fniRR/Q
 j7WM9moIIpAK3O00M2DgnjX3RMtsMiwA2Y2IF2TLGN37nk0E+ufh8CIiHgNxa+JJyMFuHpFRB7G
 6UkoTGimBMJ8NahsYFdw690Z+fC9ctShuog6n4OkMK7k0UEr3s6k2w1UVqcb8mf0=
X-Gm-Gg: ASbGncvu/2A3DNnJ1WYxVMg9C84lFjOWyYlw0z6No4Rx3Ien2EQ+92YJc2atHNf8Q9U
 n8IP1LDKJDQbXFda1JbJ/0ES48DTklxBnXlQk2yw9qhUKTi3JCWNurZmdvuZS0F+pjV1ZuAp1E8
 3s5sNiugaJ9bDS3aNw4ySim+KATGrUIZgvSAFj93aYrgOS+yQV9IyPHgPbJwbH0YGtYkSGesZ2X
 4CjMxa5anYUV6ZPSwiwSLa1FLZ/+BK+ATpFOaROYEXBW193rMZSQgW3y0cuGaxQKjawkW5O0ron
 6ELyXXXEVnYsjQ==
X-Received: by 2002:a17:907:c1e:b0:ad8:55d8:38b7 with SMTP id
 a640c23a62f3a-ad89888d678mr161593866b.7.1748365455228; 
 Tue, 27 May 2025 10:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0deVlRLi5YZvAYmuPNc+rsjSmR4hrl2Qq6DmZN5KnWkgeeSH+5FB9M1l5cPVAl4NLDtac2Q==
X-Received: by 2002:a17:907:c1e:b0:ad8:55d8:38b7 with SMTP id
 a640c23a62f3a-ad89888d678mr161588866b.7.1748365454765; 
 Tue, 27 May 2025 10:04:14 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8954b1601sm84478766b.64.2025.05.27.10.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:04:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 4/6] rust: add qemu-api doctests to "meson test"
Date: Tue, 27 May 2025 19:04:02 +0200
Message-ID: <20250527170404.1580482-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527170404.1580482-1-pbonzini@redhat.com>
References: <20250527170404.1580482-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E5tBFFrtgzb95z3dFJ1D4BYaFbEij8GQvOyCNdxkey8_1748365456
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 27 May 2025 17:04:22 -0000

Doctests are weird.  They are essentially integration tests, but they're
"ran" by executing rustdoc --test, which takes a compiler-ish
command line.  This is supported by Meson 1.8.0.

Because they run the linker and need all the .o files, run them in the
build jobs rather than the test jobs.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst                 |  2 ++
 .gitlab-ci.d/buildtest-template.yml |  3 ++-
 .gitlab-ci.d/buildtest.yml          | 11 +++--------
 rust/qemu-api/meson.build           |  9 +++++++++
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 11328c05b45..f66f2bef60b 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -66,6 +66,8 @@ be run via ``meson test`` or ``make``::
 
    make check-rust
 
+Note that doctests require all ``.o`` files from the build to be available.
+
 Supported tools
 '''''''''''''''
 
diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 118371e377d..fea4e8da2f1 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -76,7 +76,8 @@
       fi
     - section_end buildenv
     - section_start test "Running tests"
-    - $MAKE NINJA=":" $MAKE_CHECK_ARGS
+    # doctests need all the compilation artifacts
+    - $MAKE NINJA=":" MTESTARGS="--no-suite doc" $MAKE_CHECK_ARGS
     - section_end test
 
 .native_test_job_template:
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 248aaed1370..0fdde54bf8e 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -41,7 +41,7 @@ build-system-ubuntu:
     IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-docs --enable-rust
     TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
-    MAKE_CHECK_ARGS: check-build
+    MAKE_CHECK_ARGS: check-build check-doc
 
 check-system-ubuntu:
   extends: .native_test_job_template
@@ -115,7 +115,7 @@ build-system-fedora:
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs --enable-crypto-afalg --enable-rust
     TARGETS: microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
-    MAKE_CHECK_ARGS: check-build
+    MAKE_CHECK_ARGS: check-build check-doc
 
 build-system-fedora-rust-nightly:
   extends:
@@ -127,12 +127,7 @@ build-system-fedora-rust-nightly:
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
index c647493f712..10e8210f30f 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -44,6 +44,15 @@ rust.test('rust-qemu-api-tests', _qemu_api_rs,
 qemu_api = declare_dependency(link_with: [_qemu_api_rs],
   dependencies: [qemuutil_rs, qemu_api_macros, qom, hwcore, chardev, migration])
 
+# Doctests are essentially integration tests, so they need the same dependencies.
+# Note that running them requires the object files for C code, so place them
+# in a separate suite that is run by the "build" CI jobs rather than "check".
+rust.doctest('rust-qemu-api-doctests',
+     _qemu_api_rs,
+     protocol: 'rust',
+     dependencies: qemu_api,
+     suite: ['doc', 'rust'])
+
 test('rust-qemu-api-integration',
     executable(
         'rust-qemu-api-integration',
-- 
2.49.0


