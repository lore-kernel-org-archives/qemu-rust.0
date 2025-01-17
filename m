Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiEF-0001wx-AY
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiEC-0001vO-Tl
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiEA-00085j-Cn
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPqO3KKHtl5ANg7/aro6hR1uN7oeqpunby/BKuICj8Q=;
 b=aRtb+ghRJsbP571u8JnfS25EJb/maKgqKz3Rr591XJeSXdvKQbz6mu9skuEAeKCYvRu+6H
 AtyLA5hjzA19OGALkYWLtg84BDmwxoYFBmzHKKZDROyeWWs2HvPbm5IMTQNy9IzJumuEvL
 zEbify/J9z2h0z9AoOyoitUEX/SZgQo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-_isSn26APryU8Aw3QUQh6Q-1; Fri, 17 Jan 2025 04:01:16 -0500
X-MC-Unique: _isSn26APryU8Aw3QUQh6Q-1
X-Mimecast-MFC-AGG-ID: _isSn26APryU8Aw3QUQh6Q
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aaf901a0ef9so164146466b.0
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104474; x=1737709274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BPqO3KKHtl5ANg7/aro6hR1uN7oeqpunby/BKuICj8Q=;
 b=h/LIKwho++mkssEe8wPLRh0fSQ9IHOnsUEdO5pxf0FsCd7W4f/zy6fD2aSIipnJPue
 Ua+42rU20dBDlcKxkuMxsCN4YwGyF76f0y/bDp/t/EK3n48+3R6shX8Y6KCsaugl4Smv
 L81NTQm3M0c4NQWTnDsjNfQuciHA4zKLDzz/YB9Kg8+MqZFDpV9eO5k+D7ywNOoNa5ZK
 dst2zq5Ze2L72u1KIMFf+tmmuYJwaYCnIk971vH5HaBI7ZX8AJpZ41zFnVBrpyAQimC7
 xM1gB91B61WDbEWXV0n5ivIJRXyvn9aGVNL9jJiRg5yYCm8ze3NXF8M4FofjmOh7je4A
 ZidA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/pPP01v7W5bddvPSXGWp8nlxmqjuwrJ4KQAyO6u8ALt9kY9eGv+3RwTbtDWApOxbqMZ38Ff3yvSI=@nongnu.org
X-Gm-Message-State: AOJu0YwquLs/mwFgWwvZ5PyrU4dyVC8YFs5vdWYVfWVWC0gQJQMa7WJF
 V2dsNsNlRnFShdrKgqOU8xFOb2ut5r/ARJWBa7eKQtNOSqRGSlZ33+7+yeBT6eoLdvvDVdel5sG
 W/sBDsPiXEY5omg/hRovTR50VuhjAi4vkpmBJbMf2rPml5l+OQ6Im/DRRSjUsIQ==
X-Gm-Gg: ASbGncsNURjzkeo5owbvPMzCxfaHjiQjPkfNNxop/282VXAS2hQtLT34DyTpBGsbbG8
 98QioQbvnxPsZT6Huqc+OX3qBQgU/KCZ6xsfo9Dtqd5Jb/JPpybFCJAN2vgU/pCaw00VFQyjVH0
 dNj9bSZbs7sZTc30T/1xusD84ElX7oAYclIWRdZY+5myI4DRYjm3whpGtwBPlBfREbkDoR+8zNc
 bwr6dIiucIPTyXqHNqMk7glSiSTBeDxHzg33UPew73DUo00ARRsKoys/DN+
X-Received: by 2002:a17:907:86a3:b0:ab2:db7b:5db3 with SMTP id
 a640c23a62f3a-ab38b4c8520mr216833666b.54.1737104473910; 
 Fri, 17 Jan 2025 01:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqVVadJoAURPuj9qG6UA2d1Ww6Do42aCy9rlg3bBLIvmHMy9EWjTbuoQ4KFXomFtmR5sShBQ==
X-Received: by 2002:a17:907:86a3:b0:ab2:db7b:5db3 with SMTP id
 a640c23a62f3a-ab38b4c8520mr216829166b.54.1737104473456; 
 Fri, 17 Jan 2025 01:01:13 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f223fesm135133266b.105.2025.01.17.01.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:01:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 10/10] rust: vmstate: make order of parameters consistent in
 vmstate_clock
Date: Fri, 17 Jan 2025 10:00:46 +0100
Message-ID: <20250117090046.1045010-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117090046.1045010-1-pbonzini@redhat.com>
References: <20250117090046.1045010-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mAE1eNSv3OT23gzgK1cJD0bIdKK6A5QhmYRwgWjmOJw_1737104475
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
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
X-List-Received-Date: Fri, 17 Jan 2025 09:01:21 -0000

Place struct_name before field_name, similar to offset_of.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device_class.rs | 2 +-
 rust/qemu-api/src/vmstate.rs           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index e0d3532e956..b052d98803f 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -27,7 +27,7 @@ extern "C" fn pl011_clock_needed(opaque: *mut c_void) -> bool {
     minimum_version_id: 1,
     needed: Some(pl011_clock_needed),
     fields: vmstate_fields! {
-        vmstate_clock!(clock, PL011State),
+        vmstate_clock!(PL011State, clock),
     },
     ..Zeroable::ZERO
 };
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 70dd3c4fc48..89ca643a58f 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -457,7 +457,7 @@ macro_rules! vmstate_struct {
 #[doc(alias = "VMSTATE_CLOCK")]
 #[macro_export]
 macro_rules! vmstate_clock {
-    ($field_name:ident, $struct_name:ty) => {{
+    ($struct_name:ty, $field_name:ident) => {{
         $crate::bindings::VMStateField {
             name: ::core::concat!(::core::stringify!($field_name), "\0")
                 .as_bytes()
-- 
2.47.1


