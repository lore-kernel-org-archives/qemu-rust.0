Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrly-0004KM-Ao
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrku-0003XP-Of
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkr-0005k5-Ak
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIxpaB6/ZhVVZ3Mu10nisbWNoNkSNb8M6k4MEeUMH1w=;
 b=LKCgfHDyGzuhRmpOyCDoKdC9ogyxnjAClp7KO44kYIufGF2PJPnVyDqdtrfAH02DlmXKWB
 ocrWrelaxzDV25Hm+UTQnthx7OrWFeWYHZx0keF97RyjBKX6odqPhtKeqDZBpClsaPsAzl
 SNZD+SbGw2kys39CsHIIQilNosHpbto=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-7ytTU49cM6y1oTsTn56Yxw-1; Mon, 05 May 2025 05:04:51 -0400
X-MC-Unique: 7ytTU49cM6y1oTsTn56Yxw-1
X-Mimecast-MFC-AGG-ID: 7ytTU49cM6y1oTsTn56Yxw_1746435890
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d734da1a3so18262965e9.0
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435889; x=1747040689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIxpaB6/ZhVVZ3Mu10nisbWNoNkSNb8M6k4MEeUMH1w=;
 b=YNYOQdN21Wa38qpYYeaJOIT0MnA0cSmM8Q/jQFE7J/5BoWMwaWrgB2hH/aEvjnUoaM
 E5qccfCW4VOLfJXrw+PCtndrSOUgg4wQ7jFE0fBGcZJOtbJjpnbJ3EO0IooqfE7BmKpZ
 m9si783VNJX3n+CEnD/LBEg+e370zyC2j3FQsfHByLDP+vBkOILfZokCredXJa4po1jU
 q4zchqiqaJOKGMGBWfwz3TTE135nxwIMTsdeZIOXL6SH2r32lDzDDcnsIMQdOZUsZxpi
 ZITTKvPOV5dNVpxg0dKiDMN6QSYWayNetHcpLcVy8HKm/9oGH/oz0yVjzRv/lTsno0uQ
 Rnnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULNJdF7RCPguod1jV3FOxOe0nb4oqiSmjE0o7TN6S6QBiTh95Dz11v1FeLlNhmbHSoTZG5E62ANI0=@nongnu.org
X-Gm-Message-State: AOJu0Yy6NVTpOxdqDp6+2fM6oeJAyECdluMXx9Dg6vK6ak1gLeReQxbp
 GlFra9uCl953/UI8+Q2P4Ajj1VNv8PGV3NEjJicvzdEY2qbC5dkfTkh5YjpiN/iswrUjRr9663W
 KKO8SU3Cjc5gNamHkURxzd4MTlpS2yGM+2CfN1VRiQz3F/RG6zSyo04g4zYc=
X-Gm-Gg: ASbGnctNyHERhOTsjweavKtHgzI+g88KU6tqwk773OjUZyyTNh4rHZxiZibBx4Jf/1M
 wTc32nKPM5AGEgMDdbAHG1hkC8VKIKBs239L/YT/YznEjdOWm9ZB92MxmVoTEEnZmBKC0EOH588
 FFdfOP7V3vqAdn9nZe7v0+1PyrLIH0hS+qv1MYfncxS2mZrpBE91Xp/F0zMbo50tyfeSPPx7JfQ
 ioQrZ8gASm5OP6P6Os6iORomR8cNiza5nq+stYJlcxy5IaFFbglVN+p+kQCxeiMiHnLiEYSmPrZ
 E2QrZuQd3H/kvcI=
X-Received: by 2002:a05:600c:1e8d:b0:43c:f8fc:f69a with SMTP id
 5b1f17b1804b1-441c48b05edmr59869745e9.4.1746435889650; 
 Mon, 05 May 2025 02:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU3HBgeE9+NVL2gCkYNhERdLc3dP6tTfX8jB6xXHmxVF0BUOEr8pd7nLrYMZCQfoTuKan9zQ==
X-Received: by 2002:a05:600c:1e8d:b0:43c:f8fc:f69a with SMTP id
 5b1f17b1804b1-441c48b05edmr59869455e9.4.1746435889298; 
 Mon, 05 May 2025 02:04:49 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89d150fsm125521165e9.15.2025.05.05.02.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:04:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 04/11] rust: let bilge use "let ... else"
Date: Mon,  5 May 2025 11:04:29 +0200
Message-ID: <20250505090438.24992-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505090438.24992-1-pbonzini@redhat.com>
References: <20250505090438.24992-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VpeBQOl0jJv25yYujwgjyJjH9bGGZ_KlEuDjevc1HfM_1746435890
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 05 May 2025 09:04:57 -0000
X-List-Received-Date: Mon, 05 May 2025 09:04:57 -0000

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst                           |  3 --
 subprojects/bilge-impl-0.2-rs.wrap            |  1 -
 .../packagefiles/bilge-impl-1.63.0.patch      | 45 -------------------
 3 files changed, 49 deletions(-)
 delete mode 100644 subprojects/packagefiles/bilge-impl-1.63.0.patch

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index c7dfba98de1..8167ff49aa9 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -76,9 +76,6 @@ are missing:
 
 * ``cast_mut()``/``cast_const()`` (1.65.0).  Use ``as`` instead.
 
-* "let ... else" (1.65.0).  Use ``if let`` instead.  This is currently patched
-  in QEMU's vendored copy of the bilge crate.
-
 * Generic Associated Types (1.65.0)
 
 * ``CStr::from_bytes_with_nul()`` as a ``const`` function (1.72.0).
diff --git a/subprojects/bilge-impl-0.2-rs.wrap b/subprojects/bilge-impl-0.2-rs.wrap
index d14c3dc769b..4f84eca1ccd 100644
--- a/subprojects/bilge-impl-0.2-rs.wrap
+++ b/subprojects/bilge-impl-0.2-rs.wrap
@@ -5,7 +5,6 @@ source_filename = bilge-impl-0.2.0.tar.gz
 source_hash = feb11e002038ad243af39c2068c8a72bcf147acf05025dcdb916fcc000adb2d8
 #method = cargo
 patch_directory = bilge-impl-0.2-rs
-diff_files = bilge-impl-1.63.0.patch
 
 # bump this version number on every change to meson.build or the patches:
 # v2
diff --git a/subprojects/packagefiles/bilge-impl-1.63.0.patch b/subprojects/packagefiles/bilge-impl-1.63.0.patch
deleted file mode 100644
index 987428a6d65..00000000000
--- a/subprojects/packagefiles/bilge-impl-1.63.0.patch
+++ /dev/null
@@ -1,45 +0,0 @@
---- a/src/shared/discriminant_assigner.rs
-+++ b/src/shared/discriminant_assigner.rs
-@@ -26,20 +26,20 @@
-         let discriminant_expr = &discriminant.1;
-         let variant_name = &variant.ident;
- 
--        let Expr::Lit(ExprLit { lit: Lit::Int(int), .. }) = discriminant_expr else {
-+        if let Expr::Lit(ExprLit { lit: Lit::Int(int), .. }) = discriminant_expr {
-+            let discriminant_value: u128 = int.base10_parse().unwrap_or_else(unreachable);
-+            if discriminant_value > self.max_value() {
-+                abort!(variant, "Value of variant exceeds the given number of bits")
-+            }
-+
-+            Some(discriminant_value)
-+        } else {
-             abort!(
-                 discriminant_expr,
-                 "variant `{}` is not a number", variant_name;
-                 help = "only literal integers currently supported"
-             )
--        };
--
--        let discriminant_value: u128 = int.base10_parse().unwrap_or_else(unreachable);
--        if discriminant_value > self.max_value() {
--            abort!(variant, "Value of variant exceeds the given number of bits")
-         }
--
--        Some(discriminant_value)
-     }
- 
-     fn assign(&mut self, variant: &Variant) -> u128 {
---- a/src/shared/fallback.rs
-+++ b/src/shared/fallback.rs
-@@ -22,8 +22,9 @@
-             }
-             Unnamed(fields) => {
-                 let variant_fields = fields.unnamed.iter();
--                let Ok(fallback_value) = variant_fields.exactly_one() else {
--                    abort!(variant, "fallback variant must have exactly one field"; help = "use only one field or change to a unit variant")
-+                let fallback_value = match variant_fields.exactly_one() {
-+                    Ok(ok) => ok,
-+                    _ => abort!(variant, "fallback variant must have exactly one field"; help = "use only one field or change to a unit variant")
-                 };
- 
-                 if !is_last_variant {
-- 
2.49.0


