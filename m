Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA0DC5DF7D
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:39:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKmy-00054S-1K; Fri, 21 Aug 2026 04:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmx-00052a-Cv
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmv-0008KV-CL
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2i19n0p9YgArVOv8vKeFeUdAlRf+ZdvKQUP5HpsMcQ=;
 b=Hm6yOjPCpZisVXTM8ZY5B73IYLiKoiLLjdAKZguADsRjEEB3buCBaIo7cHoV91TqIKIIfK
 Z+c2WvzFvUymYdGsFueg6E7qJIJKV4SAq+4iifMYmIbjYU7eAl905W+bMLjb/hlaZtN0ZG
 Ct5+K3xQhIhOBXz4Sba6mLs/hFEX4JM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-AL7XjQG2NZmfb1LamiiOhw-1; Fri, 21 Aug 2026 04:39:43 -0400
X-MC-Unique: AL7XjQG2NZmfb1LamiiOhw-1
X-Mimecast-MFC-AGG-ID: AL7XjQG2NZmfb1LamiiOhw_1787301582
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-6a3f8cbd9feso974065a12.2
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301582; x=1787906382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=M2i19n0p9YgArVOv8vKeFeUdAlRf+ZdvKQUP5HpsMcQ=;
 b=I44ptIziow7UhxTCPO1CBcFNxKbqoWOAvWg2KTul9jq8nJrrYxu+ozjG8TBWTKXVZu
 iqkt78BZR6/9nuVFiqgn731qnXmyshzyd7eKyKoE4IPRHroU0nkMMvCLgnHfZpVyfy6P
 W8CeomPNnwB6SR+8WRIFuWQyyODScjNMQsX94cYnLQ/nt9ybLP5/vx2+BjlKme78a70J
 4Bg0/kDjHffdqRNW/YMagjFCns7faPKpvOC0z/GQ6pD2o4J2IhS37op+ic8hvAIojFFk
 DGkNxUW4quT89Gt23rLkSm0BXa6uk5LegqqeuPuCXlrsdmLUM8DFuuDJzo2+mBLCbGQ0
 TA9A==
X-Gm-Message-State: AFuF++mVGRfwaHnW/q3MQt6z4ZHRQmv1q/8jtaRpWauhhBMQJn9Rtius
 yrJHl5Ht4N0x0YLAdhxze20ssNS0EZdsWF3Io/DPTb3CGg+eagUDMmR/2azu7c67muyHoJGj9m/
 WUnUbixrhqm7QJYBM9uCPjpoFXv4ukdVoAWad8bFx8w5RKgDaB7rceGbn10pzAAM=
X-Gm-Gg: AR+sD10Zx4Bu0uxkaTaNZIxzGt0f6GtfJ4m+jHd2piRNza8eJW9Oxa+uKLK2e6q+xkG
 f3Cl85Z0OCb4aApZWNf4prPJS6tO7buctgtfFktQvecBZW5dm+4tQlz3yLnsdhws7pdWj2N/PSS
 uO0tdu8qDlJUMg6mB7KdSua8LUpiNyGnfcElKc1+hVDNTAczsM4DhsQ0+Lw4tYFcdfiXt5DoO+2
 FIixLW8p7pkW/2dERro3Jz14zMycQQeV8d7vwG5MoFtMIYGmCkTztTXY1iLZE4d5q3uALn8o836
 MHtFApjQgrGz7i3q5mMqxr5b6eiN1CQX9+l4QBIZb5KHRPrplJSYavCUcXuVhXj7U77NinqQhBc
 oyiY9H7VKNMYxtAefNUCtvILUdNq098S5SZPem15+dnCvmUXNzQguuK/Oo2dqLEFMWxYrubBbVW
 E4e3k=
X-Received: by 2002:a05:6402:43c5:b0:6a3:8652:a373 with SMTP id
 4fb4d7f45d1cf-6a42f184819mr5437365a12.3.1787301582216; 
 Fri, 21 Aug 2026 01:39:42 -0700 (PDT)
X-Received: by 2002:a05:6402:43c5:b0:6a3:8652:a373 with SMTP id
 4fb4d7f45d1cf-6a42f184819mr5437315a12.3.1787301581799; 
 Fri, 21 Aug 2026 01:39:41 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff177859sm5193106a12.27.2026.08.21.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 6/9] scripts: add functionality to update wrap files from
 Cargo.lock
Date: Fri, 21 Aug 2026 10:39:21 +0200
Message-ID: <20260821083925.2008135-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P5FYkk3KMBBUCPQA4jUWriVIxYqDOvn4xHf8TvyhUs8_1787301582
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

.wrap files and Cargo.lock contain pretty much the same information.
QEMU uses the former to make it easier for distros to use a local
registry, and also because Meson <1.13 does not use Cargo.lock for
the "meson subprojects" command.  This however introduces an
inconvenience when running "cargo update", in that the wrap
files have to be updated by hand.

Add the possibility to get new versions from Cargo.lock and not
just from a local registry, thus automating the update.

For now, only existing wrap files are modified.  This means
that semver-breaking updates need to be done (at least partly)
by hand; it is enough to rename the wrap file prior to running
the script.

While the need for this script is a lot smaller with Meson 1.13, it
would still remain useful for packages that have a patch directory.
Perhaps a bit overengineered, but since we have it...

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/get-wraps-from-cargo-registry.py | 77 +++++++++++++++++++++---
 1 file changed, 69 insertions(+), 8 deletions(-)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/get-wraps-from-cargo-registry.py
index 636e4ba3474..b3ae5a2c284 100755
--- a/scripts/get-wraps-from-cargo-registry.py
+++ b/scripts/get-wraps-from-cargo-registry.py
@@ -3,7 +3,8 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 """
-get-wraps-from-cargo-registry.py - Update Meson subprojects from a global registry
+get-wraps-from-cargo-registry.py - Update Meson subprojects from a Cargo
+registry or from the versions pinned in Cargo.lock.
 """
 
 # Copyright (C) 2025 Red Hat, Inc.
@@ -18,6 +19,7 @@
 import shutil
 import subprocess
 import sys
+import tomllib
 
 
 def get_name_and_semver(namever: str) -> tuple[str, str]:
@@ -75,6 +77,49 @@ def rewrite_source(self, section: configparser.SectionProxy, orig_namever: str,
         return True
 
 
+class CargoLock(CrateSource):
+    """Locate crates by the versions pinned in a Cargo.lock file."""
+
+    origin = "crates.io"
+
+    def __init__(self, path: str):
+        with open(path, "rb") as f:
+            data = tomllib.load(f)
+
+        self.versions: dict[str, list[str]] = {}
+        self.checksums: dict[str, str] = {}
+        for pkg in data.get("package", []):
+            # workspace members have neither a checksum nor a crates.io tarball
+            if "checksum" not in pkg:
+                continue
+            name, version = pkg["name"], pkg["version"]
+            self.versions.setdefault(name, []).append(version)
+            self.checksums[f"{name}-{version}"] = pkg["checksum"]
+
+    def find(self, namever: str) -> str | None:
+        """Find pinned crate matching name and semver prefix"""
+        name, semver = get_name_and_semver(namever)
+        versions = sorted(self.versions.get(name, []))
+
+        # exact version match
+        if semver in versions:
+            return f"{name}-{semver}"
+
+        # semver match
+        matches = [v for v in versions if v.startswith(f"{semver}.")]
+        return f"{name}-{matches[0]}" if matches else None
+
+    def rewrite_source(self, section: configparser.SectionProxy, orig_namever: str, new_namever: str) -> bool:
+        # rewrite the download keys to fetch the pinned version from crates.io.
+        if orig_namever == new_namever:
+            return False
+        name, version = get_name_and_semver(new_namever)
+        section["source_url"] = f"https://crates.io/api/v1/crates/{name}/{version}/download"
+        section["source_filename"] = f"{new_namever}.tar.gz"
+        section["source_hash"] = self.checksums[new_namever]
+        return True
+
+
 class UpdateSubprojects:
     cargo_registry: str
     source: CrateSource
@@ -104,12 +149,13 @@ def compare_build_rs(self, orig_dir: str, source_namever: str) -> None:
             print("   This may affect the build process - please review the differences.")
 
     def update_subproject(self, wrap_file: str, source_namever: str) -> None:
-        """Modify [wrap-file] section to point to self.cargo_registry."""
+        """Modify [wrap-file] section to use the crate resolved as `source_namever`."""
         assert wrap_file.endswith("-rs.wrap")
         wrap_name = wrap_file[:-5]
 
         env = os.environ.copy()
-        env["MESON_PACKAGE_CACHE_DIR"] = self.cargo_registry
+        if self.cargo_registry:
+            env["MESON_PACKAGE_CACHE_DIR"] = self.cargo_registry
 
         config = configparser.ConfigParser()
         config.read(wrap_file)
@@ -157,9 +203,15 @@ def parse_cmdline() -> argparse.Namespace:
         parser = argparse.ArgumentParser(
             description="Replace Meson subprojects with packages in a Cargo registry"
         )
+        parser.add_argument(
+            "--cargo-lock",
+            action='store_true',
+            default=False,
+            help="Update wraps from Cargo.lock",
+        )
         parser.add_argument(
             "--cargo-registry",
-            default=os.environ.get("CARGO_REGISTRY"),
+            default=None,
             help="Path to Cargo registry (default: CARGO_REGISTRY env var)",
         )
         parser.add_argument(
@@ -170,9 +222,15 @@ def parse_cmdline() -> argparse.Namespace:
         )
 
         args = parser.parse_args()
-        if not args.cargo_registry:
-            print("error: CARGO_REGISTRY environment variable not set and --cargo-registry not provided")
+        if args.cargo_registry and args.cargo_lock:
+            print("error: --cargo-registry and --cargo-lock are incompatible")
             sys.exit(1)
+        if not args.cargo_registry and not args.cargo_lock:
+            args.cargo_registry = os.environ.get("CARGO_REGISTRY")
+            if not args.cargo_registry:
+                print("error: CARGO_REGISTRY environment variable not set and " +
+                      "--cargo-registry or --cargo-lock not provided")
+                sys.exit(1)
 
         return args
 
@@ -180,7 +238,10 @@ def __init__(self, args: argparse.Namespace):
         self.cargo_registry = args.cargo_registry
         self.dry_run = args.dry_run
         self.top_srcdir = os.getcwd()
-        self.source = CargoRegistry(args.cargo_registry)
+        if args.cargo_lock:
+            self.source = CargoLock(os.path.join(self.top_srcdir, "Cargo.lock"))
+        else:
+            self.source = CargoRegistry(args.cargo_registry)
 
     def main(self) -> None:
         if not os.path.exists("subprojects"):
@@ -193,7 +254,7 @@ def main(self) -> None:
 
             source_namever = self.source.find(namever)
             if not source_namever:
-                print(f"No installed crate found for {wrap_file}")
+                print(f"No crate found for {wrap_file}")
                 continue
 
             self.update_subproject(wrap_file, source_namever)
-- 
2.55.0


