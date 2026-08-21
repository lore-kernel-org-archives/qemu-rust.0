Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108F4C5DF8C
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKmv-0004xM-1j; Fri, 21 Aug 2026 04:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmt-0004uy-6c
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmr-0008JZ-LS
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2FiQTp7Qc/4aZI8CJqj9y3o4hGPPctMwiZp74U/qlY4=;
 b=fnO1nCasuw+tuCIH6LjxlzGCvprAnj06TubTPCogVBeCOmU6Il++jP+ARj63qFRAXNfykc
 qKi75qnYQdiOkwqJAF0qFKF8jm40nP2Xm4uI3ipjTluY9cabKeyPWo4RRbEN6+HTJ3IclD
 Yd3B8p9RWg6pUoACpfkEoIPJQK8linU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-v534PFL4Mr-pNERtgarpug-1; Fri, 21 Aug 2026 04:39:34 -0400
X-MC-Unique: v534PFL4Mr-pNERtgarpug-1
X-Mimecast-MFC-AGG-ID: v534PFL4Mr-pNERtgarpug_1787301573
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-6983e384c66so740456a12.1
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301573; x=1787906373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2FiQTp7Qc/4aZI8CJqj9y3o4hGPPctMwiZp74U/qlY4=;
 b=NL1NkZTL1mnr3Su5Rqq+Nkv/46syxQEFVsRgSSb6QTs3X+EF06JR5bUuY6X2DfTaP9
 0vVholfuaoGUjDFh4fIehVmiRSF0yD3jkng3lYsTw+U1hMEFtZrhB0/h2KGuvlG0kWm2
 Sc2wV4No1Z9ve1Q50v5p9IptnChlrMWfi8cSLYwGgRermV2hO10fDej8V+NgN/Oo1O5h
 N40379w56f5iRfmSQy48matasQIQt/QGwMUa45HN/UvLTV+68gY2JAnVpUvmZr74tWs6
 +Ei3po+vqwjmuLXk/nGtgb2Z6SDG5h9cne1+DqiEvcXiF2KqroZoXj4R4c+TvJ/gD2Jh
 llZw==
X-Gm-Message-State: AFuF++kb4hcQEs1cXo5vBaDEN1XxUvzQyEixlr0M2SlfLeHjGyFGJMtH
 TbbMmvmIOS2CqSsVTuaQru/4zjj98sRyvcreJWJiL7ZCzXsBsxO3Qg60fvS6CetS/7sW1lbOnCk
 4IlDzIzfk4Jdfr9TBbva9iDiRhYNLamUG6SW8ilrL/McBccxCJE6woL0UsyipPz0=
X-Gm-Gg: AR+sD11VQTNZqm4sjHYCJHGG8IuhaDZWGgIshWgsKAxYnk6E3zjr2MciQwwhIf3SdsT
 oHqHvEJfeY03ZWg15E0VlM9qtlRKGJSYAZzFjFQf8F1x+gB9d+KKy10wqYzQV/Su/LjeOEMKGyn
 5hVGG3Xw/y0UjTdvYKObWGsvkbmH0PB1QeP1cS38kCQGL0qlBNfl8NNO+5CI4DwJIwQgoqftFKz
 4mQCNA7v2NJ5ZtYZqWwdAfR9FY+yFQpwtiOI0cYf6XXJnmHLu8U9JL5oiDLgBO8Kdy/12FiSYvQ
 EL809YVZdHsC7Qa+Dq+k6gleNTzZc8kqyZsUz89Cs+ip5lnH2m1dWFluLDS4SKEZPXZ8wspR/MB
 9lnBsB6ZEmTtKt21FHFZ5vlHiSEVUN1mNfN4bkj9zAbeO8zVPd7x25jaKwaf4iNZVabnv0Y7wuG
 t9NyM=
X-Received: by 2002:a05:6402:e09:b0:69f:fa13:ed3 with SMTP id
 4fb4d7f45d1cf-6a42f229682mr5353490a12.16.1787301572697; 
 Fri, 21 Aug 2026 01:39:32 -0700 (PDT)
X-Received: by 2002:a05:6402:e09:b0:69f:fa13:ed3 with SMTP id
 4fb4d7f45d1cf-6a42f229682mr5353454a12.16.1787301572319; 
 Fri, 21 Aug 2026 01:39:32 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3feec9d52sm5690435a12.2.2026.08.21.01.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/9] scripts: do not assume the new version of the crate is
 present
Date: Fri, 21 Aug 2026 10:39:18 +0200
Message-ID: <20260821083925.2008135-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SeRD8Wc37sb0zhEtKSK34iOjQu0lpwlUbW0z66rjT94_1787301573
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Until now, the new version of the crate was always there in
the registry.  This will be different when crates are downloaded
from Cargo.lock, so delay the comparison of build.rs until a
point at which both source directories have been extracted.

Since the .wrap file at this point points to the new directory,
delete the old one "by hand" with shutil.rmtree instead of asking
Meson to do it before the .wrap file is changed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/get-wraps-from-cargo-registry.py | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/get-wraps-from-cargo-registry.py
index 0095bd937ec..8b45c1551f5 100755
--- a/scripts/get-wraps-from-cargo-registry.py
+++ b/scripts/get-wraps-from-cargo-registry.py
@@ -15,6 +15,7 @@
 import filecmp
 import glob
 import os
+import shutil
 import subprocess
 import sys
 
@@ -50,7 +51,7 @@ def find_installed_crate(self, namever: str) -> str | None:
     def compare_build_rs(self, orig_dir: str, source_namever: str) -> None:
         """Warn if the build.rs in the original directory differs from the registry version."""
         orig_build_rs = os.path.join(orig_dir, "build.rs")
-        new_build_rs = os.path.join(self.cargo_registry, source_namever, "build.rs")
+        new_build_rs = os.path.join(source_namever, "build.rs")
 
         msg = None
         if os.path.isfile(orig_build_rs) != os.path.isfile(new_build_rs):
@@ -81,10 +82,7 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
         if "wrap-file" not in config:
             return
 
-        # do not download the wrap, always use the local copy
         orig_dir = config["wrap-file"]["directory"]
-        if os.path.exists(orig_dir) and orig_dir != source_namever:
-            self.compare_build_rs(orig_dir, source_namever)
 
         if self.dry_run:
             if orig_dir == source_namever:
@@ -99,15 +97,6 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
             if key.startswith("source"):
                 del config["wrap-file"][key]
 
-        # replace existing directory with installed version
-        if os.path.exists(orig_dir):
-            subprocess.run(
-                ["meson", "subprojects", "purge", "--confirm", wrap_name],
-                cwd=self.top_srcdir,
-                env=env,
-                check=True,
-            )
-
         with open(wrap_file, "w") as f:
             config.write(f)
 
@@ -124,6 +113,10 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
         )
         self.changes += 1
 
+        if os.path.exists(orig_dir) and orig_dir != source_namever:
+            self.compare_build_rs(orig_dir, source_namever)
+            shutil.rmtree(orig_dir)
+
     @staticmethod
     def parse_cmdline() -> argparse.Namespace:
         parser = argparse.ArgumentParser(
-- 
2.55.0


