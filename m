Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061F3C5DF87
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:40:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKmt-0004vc-IT; Fri, 21 Aug 2026 04:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKms-0004u4-1S
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmp-0008Ii-N4
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmhrxutqvfwk8kCCA5LdrLPDB71Ss207mNaYjLClR4E=;
 b=Lrj15xByeFrOD9RwVrui9Byf5td42taXFZ+7qd6Xf3fHWAiG54HWHIwANcRLZ9PgJffq57
 PSUyoxsSzOwRz0GgpN7wnvuvcGBuBbHHanBKSS3z/B+DyoFc6Nt341SPzMy+5dCRwSmRTG
 8U5N4qbLg2Wk6Z1yv1Nw8va1gr14w6w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-BEGU4teFMwagx4TflcL5SQ-1; Fri, 21 Aug 2026 04:39:37 -0400
X-MC-Unique: BEGU4teFMwagx4TflcL5SQ-1
X-Mimecast-MFC-AGG-ID: BEGU4teFMwagx4TflcL5SQ_1787301576
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-6a3f8cbd9feso973945a12.2
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301576; x=1787906376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pmhrxutqvfwk8kCCA5LdrLPDB71Ss207mNaYjLClR4E=;
 b=Irw2tC+0/J+g8/+JL5IHi3nBQ0RQ8E5W+5RrKk5q9ZDQcoIORdDlxPEAKJaBA7g+Vj
 p2J7jGrEezhOlf4/qqcdzn/kAiwPVFVNT+jB7b36VWlO2AHAZBHmsJSzackVeIPtaI/f
 zNZ12pg/oKTnJC83K/8peM+f95hCZKaBr0O1d7mYZN7bM4FO1+OyzOniUsZi3nZeElU8
 u8ENuytgoaInOTcrR2d2How+Qgv7xBh4ElJ0LlfmD0Oq8Emssa85GMlBKYRYwFaSAuN1
 TsQt+Ha8tv4Y+cz14KRBM5H9uiXK11Ixi5zBqUwT+lgjWh9iQZR/ccCAHospPqVatcRb
 J5QA==
X-Gm-Message-State: AFuF++mjCRa9B+rICoivyhM9Na8BBZIHTd7d2HBkHZ6PwCsFOlW7PFRU
 KWNy71hGNgbDrGBwbaJqP5Lwf318/vgELaTNNE3h3C7QxifSHcf4KWIkR9Swc4R1BIufpbmorgY
 aM+NXC6unWaULxJ9F/9uTJsKFf14jCmPZhkSVVDGSye9fWiW3ldQvvrRhgzcbAdY=
X-Gm-Gg: AR+sD11ZGmmCYQvvTTkuMEsU0LzL98HT7ga1S3H88ZSYtzfBMdBd5HwpgpRJTz5nvb2
 aIRQk2cyfkf2zFcENwmNc4UClLdsFVnVxv7vBk/X4YwPKePX4S6s9W7wPMG4boO4iV56bycVbP6
 +GK4npnjHwDJ4WgFBKYv0Ckypa1gDN5gJM6gar/7mg8F65J8S9E6+uhK5pj85UAuW6UNV7IA+2P
 W494ud15sgjjX6O03hQ6R7Jsnyp0Iqw1Go/a0FBgj/WQtvjpq5/YoSwex0xD7kxyM9TyH1kb3+f
 LV4iERvg72jwnVpJjgI/OYjxFrkjjRAmmYMeIwLALah9uS+IuBZ6Ej5h9L1DiiDzf53h+g0Es06
 d6kAeOOcBOWdPZng3yRPvrx9TRhFuRaCgpDV/zBnvPjx5LKyhtWwi6gRsU30aw/pyF4AiKa/6oj
 Ju8Lo=
X-Received: by 2002:a05:6402:1f07:b0:6a1:c908:1701 with SMTP id
 4fb4d7f45d1cf-6a42f26dab3mr5425864a12.13.1787301576356; 
 Fri, 21 Aug 2026 01:39:36 -0700 (PDT)
X-Received: by 2002:a05:6402:1f07:b0:6a1:c908:1701 with SMTP id
 4fb4d7f45d1cf-6a42f26dab3mr5425827a12.13.1787301576015; 
 Fri, 21 Aug 2026 01:39:36 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff1567f8sm5559242a12.18.2026.08.21.01.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 4/9] scripts: prepare for introduction of CrateSource class
Date: Fri, 21 Aug 2026 10:39:19 +0200
Message-ID: <20260821083925.2008135-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H0HpZLZqObzTKWbv5lLr_INZc8wkek3asKtuHKr7sDM_1787301576
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/get-wraps-from-cargo-registry.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/get-wraps-from-cargo-registry.py
index 8b45c1551f5..8114f0731be 100755
--- a/scripts/get-wraps-from-cargo-registry.py
+++ b/scripts/get-wraps-from-cargo-registry.py
@@ -48,6 +48,14 @@ def find_installed_crate(self, namever: str) -> str | None:
         matches = sorted(glob.glob(f"{path}.*"))
         return os.path.basename(matches[0]) if matches else None
 
+    def rewrite_source(self, section: configparser.SectionProxy, orig_namever: str, registry_namever: str) -> bool:
+        # the registry already holds the extracted sources, so Meson does not
+        # download anything: drop the source_* keys.
+        for key in list(section.keys()):
+            if key.startswith("source"):
+                del section[key]
+        return True
+
     def compare_build_rs(self, orig_dir: str, source_namever: str) -> None:
         """Warn if the build.rs in the original directory differs from the registry version."""
         orig_build_rs = os.path.join(orig_dir, "build.rs")
@@ -82,7 +90,8 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
         if "wrap-file" not in config:
             return
 
-        orig_dir = config["wrap-file"]["directory"]
+        section = config["wrap-file"]
+        orig_dir = section["directory"]
 
         if self.dry_run:
             if orig_dir == source_namever:
@@ -92,10 +101,10 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
             self.changes += 1
             return
 
-        config["wrap-file"]["directory"] = source_namever
-        for key in list(config["wrap-file"].keys()):
-            if key.startswith("source"):
-                del config["wrap-file"][key]
+        section["directory"] = source_namever
+        if self.rewrite_source(section, orig_dir, source_namever):
+            with open(wrap_file, "w") as f:
+                config.write(f)
 
         with open(wrap_file, "w") as f:
             config.write(f)
-- 
2.55.0


