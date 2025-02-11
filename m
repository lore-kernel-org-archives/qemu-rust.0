Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1thy6D-0002Kh-MV
	for mharc-qemu-rust@gnu.org; Tue, 11 Feb 2025 16:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1thy3H-0007wH-Q2
 for qemu-rust@nongnu.org; Tue, 11 Feb 2025 16:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1thy3E-00057R-Ps
 for qemu-rust@nongnu.org; Tue, 11 Feb 2025 16:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739310255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49QZIYrrAS5aS5cSfm2FbcETY+HU9KApwMSA1aqo0yM=;
 b=iXUnaY+xs5ul72ygFEQ2Cdet1X+k40O+qMETXd6g1rVN6w46TuMT20fB/H83B8f8Na+ElE
 d/R8+tuOsNJiSG3W3VcyUMFgcjdjKPqAkFPRhwFIBnUktCseievl2pke0fZYuoWnQFcMXf
 zOtM8f6cCCI2kwbsYHX0mo6FHxMWQR8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-QhrwrscUOe2keRJ8VeJEzg-1; Tue,
 11 Feb 2025 16:44:12 -0500
X-MC-Unique: QhrwrscUOe2keRJ8VeJEzg-1
X-Mimecast-MFC-AGG-ID: QhrwrscUOe2keRJ8VeJEzg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6F0F81955DD0; Tue, 11 Feb 2025 21:44:11 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.44.32.210])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1C6AD1956048; Tue, 11 Feb 2025 21:44:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 manos.pitsidianakis@linaro.org, qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: [PATCH 02/11] meson: Add rust_block_ss and link tools with it
Date: Tue, 11 Feb 2025 22:43:19 +0100
Message-ID: <20250211214328.640374-3-kwolf@redhat.com>
In-Reply-To: <20250211214328.640374-1-kwolf@redhat.com>
References: <20250211214328.640374-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 Feb 2025 16:47:01 -0500
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
X-List-Received-Date: Tue, 11 Feb 2025 21:44:20 -0000

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 meson.build                | 36 ++++++++++++++++++++++++++++++++----
 storage-daemon/meson.build |  2 +-
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 1f26801b69..30aae6b3c3 100644
--- a/meson.build
+++ b/meson.build
@@ -3640,6 +3640,7 @@ qom_ss = ss.source_set()
 system_ss = ss.source_set()
 specific_fuzz_ss = ss.source_set()
 specific_ss = ss.source_set()
+rust_block_ss = ss.source_set()
 rust_devices_ss = ss.source_set()
 stub_ss = ss.source_set()
 trace_ss = ss.source_set()
@@ -4209,7 +4210,11 @@ foreach target : target_dirs
   arch_deps += target_specific.dependencies()
 
   if have_rust and target_type == 'system'
-    target_rust = rust_devices_ss.apply(config_target, strict: false)
+    target_rust_ss = ss.source_set()
+    target_rust_ss.add_all(rust_block_ss)
+    target_rust_ss.add_all(rust_devices_ss)
+
+    target_rust = target_rust_ss.apply(config_target, strict: false)
     crates = []
     foreach dep : target_rust.dependencies()
       crates += dep.get_variable('crate')
@@ -4349,15 +4354,38 @@ if xkbcommon.found()
 endif
 
 if have_tools
+  tools_deps = []
+  if have_rust
+    tools_rust = rust_block_ss.apply({})
+    crates = []
+    foreach dep : tools_rust.dependencies()
+      crates += dep.get_variable('crate')
+    endforeach
+    if crates.length() > 0
+      rlib_rs = custom_target('rust_tools.rs',
+                              output: 'rust_tools.rs',
+                              command: [rust_root_crate, crates],
+                              capture: true,
+                              build_by_default: true,
+                              build_always_stale: true)
+      rlib = static_library('rust_tools',
+                            rlib_rs,
+                            dependencies: tools_rust.dependencies(),
+                            override_options: ['rust_std=2021', 'build.rust_std=2021'],
+                            rust_abi: 'c')
+      tools_deps += declare_dependency(link_whole: [rlib])
+    endif
+  endif
+
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
              link_args: '@block.syms', link_depends: block_syms,
-             dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
+             dependencies: tools_deps + [authz, block, crypto, io, qom, qemuutil], install: true)
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              link_args: '@block.syms', link_depends: block_syms,
-             dependencies: [block, qemuutil], install: true)
+             dependencies: tools_deps + [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                link_args: '@block.syms', link_depends: block_syms,
-               dependencies: [blockdev, qemuutil, selinux],
+               dependencies: tools_deps + [blockdev, qemuutil, selinux],
                install: true)
 
   subdir('storage-daemon')
diff --git a/storage-daemon/meson.build b/storage-daemon/meson.build
index 5e61a9d1bd..92bc2e0cba 100644
--- a/storage-daemon/meson.build
+++ b/storage-daemon/meson.build
@@ -9,6 +9,6 @@ if have_tools
   qsd = executable('qemu-storage-daemon',
                    qsd_ss.sources(),
                    link_args: '@block.syms', link_depends: block_syms,
-                   dependencies: qsd_ss.dependencies(),
+                   dependencies: tools_deps + qsd_ss.dependencies(),
                    install: true)
 endif
-- 
2.48.1


