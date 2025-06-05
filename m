Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7ZR-0003z5-Or
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7ZP-0003yC-1N
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7ZN-0000Tr-DV
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNmC5Do3yi81y5Ng9JdAMfDVJMpEljlycID+S3omCnY=;
 b=RjyRp0/6Wbns8W4I5U4YZI1u4adW8+WwZZ52OdzFhxA/p4M1+d8UqVyU5ihHwZ4LYKqFUR
 rRfjBILflUntB2cxGpeX82jPCOVcfDx8qOXOR0o1pYNhk3xIAQKVQxSByGJ1QC3q6k9c1/
 vZFvOYxFc51RSN4N0KhvqjRO16GQBho=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-5lWtbSDJPgeCP59_bh-IcQ-1; Thu, 05 Jun 2025 06:11:30 -0400
X-MC-Unique: 5lWtbSDJPgeCP59_bh-IcQ-1
X-Mimecast-MFC-AGG-ID: 5lWtbSDJPgeCP59_bh-IcQ_1749118290
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso6607565e9.2
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118290; x=1749723090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNmC5Do3yi81y5Ng9JdAMfDVJMpEljlycID+S3omCnY=;
 b=o6zDppdoiSkGWPVkF1OTO7CNnVtDuHxLP8kT73uHwMCH0hI3JayEni34HPC/4RgUkW
 VhKN0iidqXNx9VRTdX6MK4Z+9Z2pTAQ31CnjDmnEr/ETR08pqmNHf3lZVi/w2+lgIZuc
 fZiHUnWxnA0rfgjXKRuzfN4Kdb01tHkpEepkW2UwmhPrNJkJqUk3ZIFrWIZgtedi6EJB
 dmoIaBfAVlIVsWFsU45H4UxGeiMiwma8A//gUm/X5AvNtQD1RzBKeQB6Ckmf/nhf33hA
 qRMM+4ucATgxvPxx8PuFTUCCJ4ve2zb4JWKeEu+NfsAW1PTCr9eWAQSysjm/RfaV7JaF
 FLVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWET2R2arIw32MDgN9uR14M6stxK0ErPovE/qI0X2nm3WqqkZKonLWqiGo+1zJP8MlhFFql97Zjze8=@nongnu.org
X-Gm-Message-State: AOJu0Yw+W9aFe4iLQHGUngvdrfAuQtHAOYXpMXz58QqtwH7SUALu/D5U
 SM//YAGijxTOEtMGP+tMKniW2kBRgbjGq8WgNT7AUbxWTGNQOHAQ0U9DX1Pst8YoGLl36x6C2wT
 zO/jLjfSrXqwf9FuIbLJZML1fU9o64PFaqF2v0jDnB9MOrRQgdNhdBsI=
X-Gm-Gg: ASbGncsEXOyTOZN5clsZLhYtZrCkqrmVT+b+tHfqB/JDeVyxz+g8kuUH8Lgw1RVKsVt
 gsGC0zwd0YJOtoX+Dej4nsKnCwQ0zRyI/P4ginMfrGGRcsWWHqi5gq1zi4tEcq1LFYXCaoQ5Onr
 D05XdwrRDF7gp6m1pxFR2aBVHGxdhNFriyQlexEbOhboOFn0P51xUL/2Vtso2Ot8LTjSHwkZuU2
 EXbUZMI9RDiATrXfXSFJh5rkLIs36KIFplgdorkocpHFhOfaN5F2kv8B7eQGvrNB9mrjCxTig73
 YwCtR1P6DMs6JA==
X-Received: by 2002:a05:600c:8b21:b0:441:b698:3431 with SMTP id
 5b1f17b1804b1-451f0b2445dmr44914635e9.28.1749118289660; 
 Thu, 05 Jun 2025 03:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGPkeZGRoWwlpWOAPwqSV4CTlLw4HFBNC3X0Hc9EfLOzc+sfCUv0SNzfbqf7xSVUhnK1XImA==
X-Received: by 2002:a05:600c:8b21:b0:441:b698:3431 with SMTP id
 5b1f17b1804b1-451f0b2445dmr44914425e9.28.1749118289295; 
 Thu, 05 Jun 2025 03:11:29 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00a00d4sm24451285f8f.92.2025.06.05.03.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:11:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, qemu-rust@nongnu.org, armbru@redhat.com,
 mkletzan@redhat.com
Subject: [PATCH 1/3] rust: make TryFrom macro more resilient
Date: Thu,  5 Jun 2025 12:11:22 +0200
Message-ID: <20250605101124.367270-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101124.367270-1-pbonzini@redhat.com>
References: <20250605101124.367270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7e_s53-rUXm6j_r5g5MfAU9vvjTDAeIzC0qN0BgtCqs_1749118290
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
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
X-List-Received-Date: Thu, 05 Jun 2025 10:11:36 -0000

If the enum includes values such as "Ok", "Err", or "Error", the TryInto
macro can cause errors.  Be careful and qualify identifiers with the full
path, or in the case of TryFrom<>::Error do not use the associated type
at all.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api-macros/src/lib.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index 103470785e3..c18bb4e036f 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -203,8 +203,8 @@ fn derive_tryinto_body(
     Ok(quote! {
         #(const #discriminants: #repr = #name::#discriminants as #repr;)*;
         match value {
-            #(#discriminants => Ok(#name::#discriminants),)*
-            _ => Err(value),
+            #(#discriminants => core::result::Result::Ok(#name::#discriminants),)*
+            _ => core::result::Result::Err(value),
         }
     })
 }
@@ -236,7 +236,8 @@ pub const fn from_bits(value: #repr) -> Self {
         impl core::convert::TryFrom<#repr> for #name {
             type Error = #repr;
 
-            fn try_from(value: #repr) -> Result<Self, Self::Error> {
+            #[allow(ambiguous_associated_items)]
+            fn try_from(value: #repr) -> Result<Self, #repr> {
                 #body
             }
         }
-- 
2.49.0


