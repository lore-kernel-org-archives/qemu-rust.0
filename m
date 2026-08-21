Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3A7C5DF87
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:41:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKn1-0005D8-9T; Fri, 21 Aug 2026 04:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKn0-0005Bz-2t
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmw-0008Kf-0O
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54WY2o82iGBH8d5H4JTOlD44ATSwqc2GBS3osVVeSxI=;
 b=HkGOpP9QgtNaG58GNP441R9S2Nsx7XbZYS+npZCGMLv4Yr64Uv5hl+tNHeebn3opznBzhK
 GkZNVHLRRHrj0jwo5MMt64xaI+38KDBjiqNIs3Q7SA/a2zpuEXvhAQJE1KTYXkaole5/Ah
 yxjjkPXkcpQJLFojEc7KuPb8+8pKc9w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-a9_xlyQTNQqrLU1DuO45Cg-1; Fri, 21 Aug 2026 04:39:39 -0400
X-MC-Unique: a9_xlyQTNQqrLU1DuO45Cg-1
X-Mimecast-MFC-AGG-ID: a9_xlyQTNQqrLU1DuO45Cg_1787301578
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-6a37252d1c8so959152a12.2
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301578; x=1787906378;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=54WY2o82iGBH8d5H4JTOlD44ATSwqc2GBS3osVVeSxI=;
 b=N1odpLwIEzoszkmsA1igphVl//cDosmCZQgI/jJqVcny7o0SITcs6PftB1I90XlW6X
 8fHz/SQjv3qgTIZYaWKSjMpKARwt8ORNN92+cZAPXdWcKeI80N2Sxb+KFK4jMmeUZz8T
 bxQ+7LLPykbXs4NNt5EZSNhN3AArlRFT1VMGBCo0BwT/wRtGgWaqitVyTLk+RytjXtXB
 +yEX2pwxeUlyTXtQWpf0LgRP5vvaVj3vBIJC9sQ/sVxYxxIrqqczfdJT6k/OVA3Re+zC
 CWLi1c2cb+L1MCdRE/UmrhCJr1Y7LCBGSkgzopiBC/tuCNT0Br4mXX0lc0mLy4iiA86n
 mCVg==
X-Gm-Message-State: AFuF++mnfoWHaAd7g5qSNSPyanAq4NJ93Ln8/4NBq9i+281SLGhStQJ7
 iXtBXK+CfIFihraUErHsnhXAuLXkdLzKSLJv1yHmxypyqTc5wnAUDeNEsVJjwFXFxQRCMT40Xr6
 0HZlDlLi47xlnTta5LOYasa8Lasp25E0ADcPhasRyJeYfyHf6S7XYDN1S0ZheYxA=
X-Gm-Gg: AR+sD11BT5XccGIz/WNWPZSJBCyOUXOg2vZ//C0VMykfpsG5PNiSOWLqx6iYu6zh66j
 6tTV1dory1dLw72OHD5to9rfAPsOqWaUV+z86janNkX4sFCBw8fPAe5WxWCfLJNxh1GPYil5vp6
 xcUW/Yq4QRkqw1UW8zp5aDZsTRGHjQcTsVhPBKWYpqOn/DSkK5f6lXhWWlXj6xRFOr235/lU2zm
 hM6x5JfW4S6jSvZ/20fAou0ynC+ov33zayjytRFoaJ8mDaiNVm2dzXWZHsLJ0zpCm3TGxcw4d6f
 uH+XVAriZHcT8zAlvrf+RtjVs9OtQ399ds4Ubr8QAvaDXN18ipvY8nC7p6xZy2E+2OQYisOeXbv
 GswvS4O2kfHSzTapUn2uY7MEnGmlthE35g5lR9apTO6CmYh6C49Pc6SwSS/AePuZjBYT1YNmGK5
 AyxDk=
X-Received: by 2002:a05:6402:190a:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a42f1df94emr4732087a12.11.1787301578239; 
 Fri, 21 Aug 2026 01:39:38 -0700 (PDT)
X-Received: by 2002:a05:6402:190a:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a42f1df94emr4732055a12.11.1787301577772; 
 Fri, 21 Aug 2026 01:39:37 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff0d5f70sm5455879a12.13.2026.08.21.01.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 5/9] scripts: introduce CrateSource abstract class
Date: Fri, 21 Aug 2026 10:39:20 +0200
Message-ID: <20260821083925.2008135-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oOar1-2ewf9IrVuqSsQOvTJztArNzXGxrWuCaCCZCP0_1787301578
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Prepare for making the script able to update .wrap files with
versions from Cargo.lock.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/get-wraps-from-cargo-registry.py | 49 ++++++++++++++++++------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/get-wraps-from-cargo-registry.py
index 8114f0731be..636e4ba3474 100755
--- a/scripts/get-wraps-from-cargo-registry.py
+++ b/scripts/get-wraps-from-cargo-registry.py
@@ -29,18 +29,36 @@ def get_name_and_semver(namever: str) -> tuple[str, str]:
     return parts[0], parts[1]
 
 
-class UpdateSubprojects:
-    cargo_registry: str
-    top_srcdir: str
-    dry_run: bool
-    changes: int = 0
+class CrateSource:
+    """Class for locating crate versions and pointing wrap files at them.
+       Subclasses know where the source of a crate comes from and how to
+       rewrite the ``[wrap-file]`` to consume it."""
 
-    def find_installed_crate(self, namever: str) -> str | None:
+    origin: str
+
+    def find(self, namever: str) -> str | None:
+        """Resolve a 'name-semver' prefix to a concrete 'name-version'."""
+        raise NotImplementedError
+
+    def rewrite_source(self, section: configparser.SectionProxy, orig_namever: str, source_namever: str) -> bool:
+        """Update the download-related keys of a [wrap-file] section."""
+        raise NotImplementedError
+
+
+class CargoRegistry(CrateSource):
+    """Locate crates already extracted in a local Cargo registry directory."""
+
+    origin = "the Cargo registry"
+
+    def __init__(self, path: str):
+        self.path = path
+
+    def find(self, namever: str) -> str | None:
         """Find installed crate matching name and semver prefix"""
         name, semver = get_name_and_semver(namever)
 
         # exact version match
-        path = os.path.join(self.cargo_registry, f"{name}-{semver}")
+        path = os.path.join(self.path, f"{name}-{semver}")
         if os.path.exists(path):
             return f"{name}-{semver}"
 
@@ -56,6 +74,14 @@ def rewrite_source(self, section: configparser.SectionProxy, orig_namever: str,
                 del section[key]
         return True
 
+
+class UpdateSubprojects:
+    cargo_registry: str
+    source: CrateSource
+    top_srcdir: str
+    dry_run: bool
+    changes: int = 0
+
     def compare_build_rs(self, orig_dir: str, source_namever: str) -> None:
         """Warn if the build.rs in the original directory differs from the registry version."""
         orig_build_rs = os.path.join(orig_dir, "build.rs")
@@ -102,7 +128,7 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
             return
 
         section["directory"] = source_namever
-        if self.rewrite_source(section, orig_dir, source_namever):
+        if self.source.rewrite_source(section, orig_dir, source_namever):
             with open(wrap_file, "w") as f:
                 config.write(f)
 
@@ -110,9 +136,9 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
             config.write(f)
 
         if orig_dir == source_namever:
-            print(f"Installing {orig_dir} from registry.")
+            print(f"👉 Installing {orig_dir} from {self.source.origin}.")
         else:
-            print(f"Replacing {orig_dir} with {source_namever}.")
+            print(f"👉 Replacing {orig_dir} with {source_namever}.")
 
         subprocess.run(
             ["meson", "subprojects", "download", wrap_name],
@@ -154,6 +180,7 @@ def __init__(self, args: argparse.Namespace):
         self.cargo_registry = args.cargo_registry
         self.dry_run = args.dry_run
         self.top_srcdir = os.getcwd()
+        self.source = CargoRegistry(args.cargo_registry)
 
     def main(self) -> None:
         if not os.path.exists("subprojects"):
@@ -164,7 +191,7 @@ def main(self) -> None:
         for wrap_file in sorted(glob.glob("*-rs.wrap")):
             namever = wrap_file[:-8]  # Remove '-rs.wrap'
 
-            source_namever = self.find_installed_crate(namever)
+            source_namever = self.source.find(namever)
             if not source_namever:
                 print(f"No installed crate found for {wrap_file}")
                 continue
-- 
2.55.0


