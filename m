Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF8FC5DF8C
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:41:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKms-0004uY-V0; Fri, 21 Aug 2026 04:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmq-0004tJ-Uj
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmo-0008IZ-Uc
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fw4f0kzvVqy0S6njX9tdZ399Ssuq2ixYN/WFdO9R4bo=;
 b=G7bFAkI2cCTEDmT2/r3PbFCwCv7cpYD9Qk8qId+D25mB5nvC5T61Ux/C+P+VvS/yirVUp5
 2cmUowNxd9n14sHJWZhQL3M6c3zJgHOTOB2gbWBbx36MpMYRgYVw7p+dRaXlDqnJ4Mkwlf
 u87KZtTh6V17/JLsMuULuCYGgGEeo50=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-m5eENNMRNmuWaL-SqBWMfg-1; Fri, 21 Aug 2026 04:39:32 -0400
X-MC-Unique: m5eENNMRNmuWaL-SqBWMfg-1
X-Mimecast-MFC-AGG-ID: m5eENNMRNmuWaL-SqBWMfg_1787301571
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c167e032f03so58179766b.1
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301571; x=1787906371;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Fw4f0kzvVqy0S6njX9tdZ399Ssuq2ixYN/WFdO9R4bo=;
 b=W9gRHHyuMhiRoZL+gzHuh7VksrRZtFcS+PjuypFIXsVasyT6RPfUhHoL5ASjLkhNUm
 ABl8C1KGKwXEtfXFodJPJfvPuMnf8kD1OZCzjWtOGngVvfY9vHzpYDN+BuVJdynQ6H8V
 iYHxEzqCfNorEeVABU4MGWfM4AH6RIMmAk23BnTuyv10yN2uGD5WWftfA6w3AhM9T6zv
 OX6pezTXX500EJgyFpuPCFxzSOX2kWpisfZyHiLqTZi3fNMjXT3G4wIznBiG3kujU8Yq
 n9hCPvXFkRkkxWxGHkAP7hhv9QSpeEB6Q9ndAZRJ234JjPXIL1iebBIomnH5GFpjpk5Q
 zr0g==
X-Gm-Message-State: AFuF++mEMhRDVN1QEazR6alG2/DAkMYjWn1qFLfYDsLiokyW2JWMsLQ9
 a60nkuoOS4MNdQ5STKfRKbIHMx5t/jwXcp5vEW/9MMInMPSZmC886yVz5qj3N1kAbo5/xVKQ+ai
 3zwN48yJXmttgXaDivwtPvAwD49APv1sUWJVJGi8kf18P3nvxJrIZ8MV39TgUmuI=
X-Gm-Gg: AR+sD11a9NKNFvoYQcdR8SZNTnoCft5zfX8v2xsetqwK/RcFXW0w8u/PD28C9FuII8B
 Pj8MUr09Fwt/91v/Jxz1Qmcyq9E3FgNelas13YlLCuGEsQSCJMFB+7JW/k6+/tLqcaPb+cGcsq7
 OZOp/CV4FQBmcLj1CHF5ycRMmJqA/acHAG7RwQWV2S5pdnQaMaa9/3fhV7I8rxjAumotWpLeqcX
 EfqLnUhK5vi12V7BxWcW4V/0C9h+siCLjKDIsIND7elM3PggLrzluwmv490ZP3WuQp5/Lz02wFJ
 FystDRWHeKuhnyU+Ct5b9xkvYqgPKW7YV1bMgepu2un2568s05dXN+9htHVz1POa9OL6OljBP4x
 KjPeaFAverVMwP6CNXZVZA7jIqVm7JBY3YUne6E9VpC7goe6gReMwYbeynTrajRJ1r2HyZjPMXr
 DsTM0=
X-Received: by 2002:a17:906:581b:b0:c16:14d1:b529 with SMTP id
 a640c23a62f3a-c246a62761fmr376783066b.18.1787301571323; 
 Fri, 21 Aug 2026 01:39:31 -0700 (PDT)
X-Received: by 2002:a17:906:581b:b0:c16:14d1:b529 with SMTP id
 a640c23a62f3a-c246a62761fmr376780966b.18.1787301570937; 
 Fri, 21 Aug 2026 01:39:30 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2459198d59sm333123466b.35.2026.08.21.01.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/9] scripts: rename variable in
 scripts/get-wraps-from-cargo-registry.py
Date: Fri, 21 Aug 2026 10:39:17 +0200
Message-ID: <20260821083925.2008135-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Bp02zVPCwDLZhy72WMNH-Pxgl3KY3ZkjXBVT1EHJ08_1787301571
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Do first the change that makes the diff larger than it should be.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/get-wraps-from-cargo-registry.py | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/get-wraps-from-cargo-registry.py
index 84c652127f9..0095bd937ec 100755
--- a/scripts/get-wraps-from-cargo-registry.py
+++ b/scripts/get-wraps-from-cargo-registry.py
@@ -47,20 +47,20 @@ def find_installed_crate(self, namever: str) -> str | None:
         matches = sorted(glob.glob(f"{path}.*"))
         return os.path.basename(matches[0]) if matches else None
 
-    def compare_build_rs(self, orig_dir: str, registry_namever: str) -> None:
+    def compare_build_rs(self, orig_dir: str, source_namever: str) -> None:
         """Warn if the build.rs in the original directory differs from the registry version."""
         orig_build_rs = os.path.join(orig_dir, "build.rs")
-        new_build_rs = os.path.join(self.cargo_registry, registry_namever, "build.rs")
+        new_build_rs = os.path.join(self.cargo_registry, source_namever, "build.rs")
 
         msg = None
         if os.path.isfile(orig_build_rs) != os.path.isfile(new_build_rs):
             if os.path.isfile(orig_build_rs):
-                msg = f"build.rs removed in {registry_namever}"
+                msg = f"build.rs removed in {source_namever}"
             if os.path.isfile(new_build_rs):
-                msg = f"build.rs added in {registry_namever}"
+                msg = f"build.rs added in {source_namever}"
 
         elif os.path.isfile(orig_build_rs) and not filecmp.cmp(orig_build_rs, new_build_rs, shallow=False):
-            msg = f"build.rs changed from {orig_dir} to {registry_namever}"
+            msg = f"build.rs changed from {orig_dir} to {source_namever}"
             # diff exits non-zero when the files differ, which is expected here
             subprocess.run(["diff", "-u", orig_build_rs, new_build_rs])
 
@@ -68,7 +68,7 @@ def compare_build_rs(self, orig_dir: str, registry_namever: str) -> None:
             print(f"⚠️  Warning: {msg}")
             print("   This may affect the build process - please review the differences.")
 
-    def update_subproject(self, wrap_file: str, registry_namever: str) -> None:
+    def update_subproject(self, wrap_file: str, source_namever: str) -> None:
         """Modify [wrap-file] section to point to self.cargo_registry."""
         assert wrap_file.endswith("-rs.wrap")
         wrap_name = wrap_file[:-5]
@@ -83,18 +83,18 @@ def update_subproject(self, wrap_file: str, registry_namever: str) -> None:
 
         # do not download the wrap, always use the local copy
         orig_dir = config["wrap-file"]["directory"]
-        if os.path.exists(orig_dir) and orig_dir != registry_namever:
-            self.compare_build_rs(orig_dir, registry_namever)
+        if os.path.exists(orig_dir) and orig_dir != source_namever:
+            self.compare_build_rs(orig_dir, source_namever)
 
         if self.dry_run:
-            if orig_dir == registry_namever:
+            if orig_dir == source_namever:
                 print(f"Will install {orig_dir} from registry.")
             else:
-                print(f"Will replace {orig_dir} with {registry_namever}.")
+                print(f"Will replace {orig_dir} with {source_namever}.")
             self.changes += 1
             return
 
-        config["wrap-file"]["directory"] = registry_namever
+        config["wrap-file"]["directory"] = source_namever
         for key in list(config["wrap-file"].keys()):
             if key.startswith("source"):
                 del config["wrap-file"][key]
@@ -111,10 +111,10 @@ def update_subproject(self, wrap_file: str, registry_namever: str) -> None:
         with open(wrap_file, "w") as f:
             config.write(f)
 
-        if orig_dir == registry_namever:
+        if orig_dir == source_namever:
             print(f"Installing {orig_dir} from registry.")
         else:
-            print(f"Replacing {orig_dir} with {registry_namever}.")
+            print(f"Replacing {orig_dir} with {source_namever}.")
 
         subprocess.run(
             ["meson", "subprojects", "download", wrap_name],
@@ -162,12 +162,12 @@ def main(self) -> None:
         for wrap_file in sorted(glob.glob("*-rs.wrap")):
             namever = wrap_file[:-8]  # Remove '-rs.wrap'
 
-            registry_namever = self.find_installed_crate(namever)
-            if not registry_namever:
+            source_namever = self.find_installed_crate(namever)
+            if not source_namever:
                 print(f"No installed crate found for {wrap_file}")
                 continue
 
-            self.update_subproject(wrap_file, registry_namever)
+            self.update_subproject(wrap_file, source_namever)
 
         if self.changes:
             if self.dry_run:
-- 
2.55.0


