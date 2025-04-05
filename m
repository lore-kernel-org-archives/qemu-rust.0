Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u10Pr-00077B-3D
	for mharc-qemu-rust@gnu.org; Sat, 05 Apr 2025 06:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Pq-00076I-03
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Po-0005rp-4u
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743847573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+I/N/OFa/M4oooPCwQgNfIF7q6n2ZVwrbiN07nAWzU=;
 b=Pt7YQxN9MVuc5Xi1KuGAFe+Va1TbYNEq/8uVTP7Fb+dB86YLrKvMYoSS+FxxEIRexpaGBy
 kTLciqXY5D4YPAFmk8JUGZKUViXif8CDGwAbISMG5fzzhVT0hwfDu9zEKE38V4FdWqeanu
 fqAzfy/Wn2z8o16ltGcYJWuG7XrYsxs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-cI-EWe50NX2G7snpS1NyLg-1; Sat, 05 Apr 2025 06:06:10 -0400
X-MC-Unique: cI-EWe50NX2G7snpS1NyLg-1
X-Mimecast-MFC-AGG-ID: cI-EWe50NX2G7snpS1NyLg_1743847569
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf172ff63so16085315e9.3
 for <qemu-rust@nongnu.org>; Sat, 05 Apr 2025 03:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743847568; x=1744452368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+I/N/OFa/M4oooPCwQgNfIF7q6n2ZVwrbiN07nAWzU=;
 b=Vu96Oej6T32bH/dHdHer9IqEr/LwJa4jw9mdBFeEJrnCM4nm/sDGLcZ7Rf37NxX6N3
 syIfkcKvljiuOZZVwTHUMAclC9RsMtYssdJNMWiE6Ug4islO8Gx6qtXzRvH7hxbWxfsH
 BtxqgGd2fVJIrpim1Fi7quHzD25XNTvxSrFthAU+Bo9Ll+JfmF8zTa9lx0TmhHkCay7h
 8q/Iy47B8eLAs2Wst2+oRnHOPGRhmD058GgNltkaBSYxUl1f5HB31IjtcKyv9SM8CspJ
 3uulTKCM4uydu3bvQjfMFlt+hSBuwMmLfvkVB2qjm5k6hJktzDnt6pw/1IvFHvs2rFS2
 5BWg==
X-Gm-Message-State: AOJu0YyD1LGeygnHW3o4tSkxCIO/QfdNaBQCY6u4P63Xg/S6qNohScUl
 8o/uzYqRyEdz+6wpCREJsbM09PDPbuLA7S1R4nlcObPGxVXN/VsMszn7vIU3d8PuM0gThIsTEyS
 Mz3WVZT05SaL09SMfadhL1O05Oksboxw8CzOZgqWqlx9IMlkaH/Md/VfegIM=
X-Gm-Gg: ASbGncvWJNAJTe/os/10W8N3VD3bzIoYNVqC2foopISdXM8PfO3cJNUAAyMAIgjEGky
 Rqmm6/WnGzUDni1PwrEFjOXdbTZcq3FX+Sgv5QFYYOl9m17zK2YTp4MYbxM6/p5+Y/pBcNVplU7
 mrKm8x8e8PzaUA53nW6gW8b7/OGKS8x9AlXSrVzl0Uw53H+ezv3/Sq81meq0ssdaLt5QF2PpaXz
 FyDi8941YM4fFWnggoOEP20X1GW/NIrGobnlUrqLJd/JVmXp8wrWDTdejHMszwqrwQIr0SUN8mq
 qLAE4Cz4Y1N5xo6nLg==
X-Received: by 2002:a05:6000:1a88:b0:391:47d8:de3a with SMTP id
 ffacd0b85a97d-39cba97f7d5mr4825688f8f.53.1743847568186; 
 Sat, 05 Apr 2025 03:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHCm7MXfcr3yOniTaQPTwQ9J+ba3OZYa5N8/P9p1ALElQ5MQSeGBgL/hWHUf+wR5hVYgK/fA==
X-Received: by 2002:a05:6000:1a88:b0:391:47d8:de3a with SMTP id
 ffacd0b85a97d-39cba97f7d5mr4825670f8f.53.1743847567777; 
 Sat, 05 Apr 2025 03:06:07 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.96.77])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d5d1sm6554233f8f.77.2025.04.05.03.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 03:06:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/3] rust: use "objects" for Rust executables as well
Date: Sat,  5 Apr 2025 12:06:01 +0200
Message-ID: <20250405100603.253421-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405100603.253421-1-pbonzini@redhat.com>
References: <20250405100603.253421-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hd7ICXXG3JSWnL3f6SMfW8t3ATZaZ7AYnm-YsfEIFDg_1743847569
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.028,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Sat, 05 Apr 2025 10:06:18 -0000

libqemuutil is not meant be linked as a whole; if modules are enabled, doing
so results in undefined symbols (corresponding to QMP commands) in
rust/qemu-api/rust-qemu-api-integration.

Support for "objects" in Rust executables is available in Meson 1.8.0; use it
to switching to the same dependencies that C targets use: link_with for
libqemuutil, and objects for everything else.

Reported-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst       |  2 --
 rust/qemu-api/meson.build | 26 +++++---------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 88bdec1eb28..8030aa42d0c 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -66,8 +66,6 @@ be run via ``meson test`` or ``make``::
 
    make check-rust
 
-Building Rust code with ``--enable-modules`` is not supported yet.
-
 Supported tools
 '''''''''''''''
 
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 858685ddd4a..8fa41c0a95e 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -45,29 +45,13 @@ _qemu_api_rs = static_library(
   dependencies: [libc_dep, qemu_api_macros],
 )
 
+qemuutil_rs = qemuutil.partial_dependency(link_args: true, links: true)
+
 rust.test('rust-qemu-api-tests', _qemu_api_rs,
           suite: ['unit', 'rust'])
 
-qemu_api = declare_dependency(link_with: _qemu_api_rs)
-
-# Rust executables do not support objects, so add an intermediate step.
-rust_qemu_api_objs = static_library(
-    'rust_qemu_api_objs',
-    objects: [libqom.extract_all_objects(recursive: false),
-              libhwcore.extract_all_objects(recursive: false),
-              libchardev.extract_all_objects(recursive: false),
-              libcrypto.extract_all_objects(recursive: false),
-              libauthz.extract_all_objects(recursive: false),
-              libio.extract_all_objects(recursive: false),
-              libmigration.extract_all_objects(recursive: false)])
-rust_qemu_api_deps = declare_dependency(
-    dependencies: [
-      qom_ss.dependencies(),
-      chardev_ss.dependencies(),
-      crypto_ss.dependencies(),
-      authz_ss.dependencies(),
-      io_ss.dependencies()],
-    link_whole: [rust_qemu_api_objs, libqemuutil])
+qemu_api = declare_dependency(link_with: [_qemu_api_rs],
+  dependencies: [qemuutil_rs, qemu_api_macros, qom, hwcore, chardev, migration])
 
 test('rust-qemu-api-integration',
     executable(
@@ -76,7 +60,7 @@ test('rust-qemu-api-integration',
         override_options: ['rust_std=2021', 'build.rust_std=2021'],
         rust_args: ['--test'],
         install: false,
-        dependencies: [qemu_api, qemu_api_macros, rust_qemu_api_deps]),
+        dependencies: qemu_api),
     args: [
         '--test', '--test-threads', '1',
         '--format', 'pretty',
-- 
2.49.0


