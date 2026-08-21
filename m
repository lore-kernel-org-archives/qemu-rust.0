Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C5BC5DF87
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKn0-0005CM-B1; Fri, 21 Aug 2026 04:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmy-00056j-NF
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmx-0008L2-47
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEkhhmfARJthnU2Ad+S3BEdQZlV4xabCHmVmi7VfYGk=;
 b=XAZnjpghZYvyP91uZb360iJtOWSOHGgB6ypbIpbp+khGOpAOBQGXQubu0tXU1sHdJOClFo
 gODFrtNxM31PUOiEda4A/1q90IjO/pRishkxqlpnEaCBDuVj3i0UrQD3Xc6a5kP+0A+OSa
 1+sNLK9H5lTrrP6sZZorPgkxcXKERgY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-7DUCyikGNmCVWLSCIjltpw-1; Fri, 21 Aug 2026 04:39:45 -0400
X-MC-Unique: 7DUCyikGNmCVWLSCIjltpw-1
X-Mimecast-MFC-AGG-ID: 7DUCyikGNmCVWLSCIjltpw_1787301584
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-698557ec1e9so656352a12.1
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301584; x=1787906384;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jEkhhmfARJthnU2Ad+S3BEdQZlV4xabCHmVmi7VfYGk=;
 b=MdALWL1eZRZHoqMLk9XQleGMuuzh0/cM+CgNFW9rdw+1bREndaqZENHgz21x/cnHmq
 eits4KjSg6ElUY7DAsUD5VyuJx/BUfkyZq6eAFLrsh1SEwCsOIXflHT6+kQIYRyR02z/
 RRzJxH3DNvwWvznSxgoF3qBWQJAw+U1HUeSg7z0QtmcHOum9jxtsD4M9vchtgMs7Gg7v
 exiv85SCfNA4wdiLhouGF7dvEpbcTblOpLESz6ncKGkP9Ifc/4j+1lGomw2qInnc7OXz
 pxtghXpNLC/Sa93H2uoy0c0S3i3mnA9zgWzU+fNI14FNpXM3uWmG2dpolp8Gi/tc3hb7
 B12A==
X-Gm-Message-State: AFuF++nQcZKUGNxSO+LS//si8pFPLu6be8EAHb9ggJKzGFXEQk9Ge2mg
 H11F+5zJk6apZHqUdsNLOgacgSh+8pQM/S3g9cM7ePXjWMf5m11UgwxRZ9A8cTtnLbd4fNwOdmC
 yco1qyJgmb7SU7kt11LuT9p7/Q24B9Nc0R9T6Qt99BU9MV3kk1jfuGK0=
X-Gm-Gg: AR+sD12Y4xzVJD/2u7VwxMz/43wHPYRD3M9YxVuiGDCytXXCqN95idrQkg2kNGzhzs1
 I4hS6EZH1x+bzc2/vYoFbfptqqQsXiv7W27KSFx1P9rBsh0e79BIOtFaChmFEMXo07boftqLM1J
 UOUk4TYsAsPxh2j8sDKb2hQP9bYkff0JbxpZzOjt4RTA4Fp2KzLTOaFLPks0K/avaJD4RBoiz0S
 v9DsdWilP46FnP4ia/FNLQ4lo2UP/ktzfHgFwpp0OtTsrInscqNMnX0B7ifPPgz2ebP+VBbuKpk
 1z2USOYzZSa1NWXR+cVaB1J2SlqG5r+QR5/e2i0VA9otVeUbrX1J4M2EWSd+7zqmAjPkMtQELnd
 WndJElhXUyIWXuVdYbTs/GI/ZV58IhP4skRChtOwrD7NTSG84TkiD0p5LB53thdoLcCXRMfKTwY
 eEX5A=
X-Received: by 2002:a17:907:9628:b0:c16:13e7:fd63 with SMTP id
 a640c23a62f3a-c2469f94a1bmr483605966b.0.1787301583851; 
 Fri, 21 Aug 2026 01:39:43 -0700 (PDT)
X-Received: by 2002:a17:907:9628:b0:c16:13e7:fd63 with SMTP id
 a640c23a62f3a-c2469f94a1bmr483599966b.0.1787301583427; 
 Fri, 21 Aug 2026 01:39:43 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24589e224dsm363825566b.2.2026.08.21.01.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 7/9] scripts: add the possibility of a quick update of the
 pacakge
Date: Fri, 21 Aug 2026 10:39:22 +0200
Message-ID: <20260821083925.2008135-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: irgqHVMOw55mnBiiBGHnB3v3mc0upCdJzmIYkh2asxY_1787301584
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 scripts/get-wraps-from-cargo-registry.py | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/get-wraps-from-cargo-registry.py
index b3ae5a2c284..a26fe135eb9 100755
--- a/scripts/get-wraps-from-cargo-registry.py
+++ b/scripts/get-wraps-from-cargo-registry.py
@@ -166,10 +166,13 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
         orig_dir = section["directory"]
 
         if self.dry_run:
-            if orig_dir == source_namever:
-                print(f"Will install {orig_dir} from registry.")
-            else:
+            if orig_dir != source_namever:
                 print(f"Will replace {orig_dir} with {source_namever}.")
+            elif not os.path.exists(orig_dir) or self.cargo_registry:
+                print(f"Will install {orig_dir} from {self.source.origin}.")
+            else:
+                print(f"Will update {orig_dir} from cache.")
+                return
             self.changes += 1
             return
 
@@ -181,10 +184,19 @@ def update_subproject(self, wrap_file: str, source_namever: str) -> None:
         with open(wrap_file, "w") as f:
             config.write(f)
 
-        if orig_dir == source_namever:
+        if orig_dir != source_namever:
+            print(f"👉 Replacing {orig_dir} with {source_namever}.")
+        elif not os.path.exists(orig_dir) or self.cargo_registry:
             print(f"👉 Installing {orig_dir} from {self.source.origin}.")
         else:
-            print(f"👉 Replacing {orig_dir} with {source_namever}.")
+            print(f"👉 Updating {orig_dir} from cache.")
+            subprocess.run(
+                ["meson", "subprojects", "update", "--reset", wrap_name],
+                cwd=self.top_srcdir,
+                env=env,
+                check=True,
+            )
+            return
 
         subprocess.run(
             ["meson", "subprojects", "download", wrap_name],
-- 
2.55.0


