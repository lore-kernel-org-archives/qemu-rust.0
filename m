Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAmGO-0006ku-Cx
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 05:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmGN-0006k9-8p
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmGL-0004yA-Q5
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746176453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVdtL49sOwGbUcvuljWA7jXxsATBmy/UlSJlZk7Ssrs=;
 b=h9qSrijHcRKcbwGTgd1YtWOYXsudfnXsBxNx9fwCZPHWyCxyGX6R2ZWgsxBl4KgT+fEaqM
 urVc2efLdDhIxYZ/6cCW9uA+dMVNlUf0nRy024095lLmCol+TAoxZBefQ+wKFD0EXCOXpX
 OHDjSc0k7a9x0S+5lSzq8Z5C9FXSUcM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-aeeogUARPN-O3xNWC-Clgw-1; Fri, 02 May 2025 05:00:51 -0400
X-MC-Unique: aeeogUARPN-O3xNWC-Clgw-1
X-Mimecast-MFC-AGG-ID: aeeogUARPN-O3xNWC-Clgw_1746176449
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39135d31ca4so648758f8f.1
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 02:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746176448; x=1746781248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVdtL49sOwGbUcvuljWA7jXxsATBmy/UlSJlZk7Ssrs=;
 b=cHmrkF7aDGx1OQqGbrP7/Zl57U6D/9MIa8jt34U6VmFOpdZ4jgZbLMDtfMW7QqWzeK
 vnSEM1cWVDMFMz2kHOpXgPwlDSVA/OAqQPiqFC6xvqa9RPk/AUnFwsjgtWs2dN5pRCFj
 HOnvtu7rd8zbxeUf3XkdNSn2s5ztlc2y/LqESmzrLUqeDEkkxCJ+2T+kfvbnTySndqoP
 qkZ39RnOxdPbb1KsG7efdbNVpE/ZVnPt4lN51yyHnbTYVbaPSFHNgVOjA2z9WQUzyyYO
 6N7MOEq8p1l32dQDz7TfxmvVrgOcVN7eXcXJwBdfWAvelPT7ZZgikq/JcQ6Kf7AaFsm9
 Szww==
X-Gm-Message-State: AOJu0Yz7PsU6EpCqkG8TOVJqY+5BNtWFsVHH9tXLb0VPnowBfndcJFG4
 e027rOBHxi3Xdhuu/VHYDOG7DF84rjAiJJPlU+5idIoRmd81s6Gh+6eshX0uiG7CqF0cmfFA3vk
 MYl/Q/TnnIQ0xblgirPTcnXVYFJffNI3iw6qhg3BMDKQuNBZryuenW0y41Js=
X-Gm-Gg: ASbGncuc9lCV+C/hQo47TXEsrOI6X56am0uCBBsCzrNIpwLv66Q0+UROOGaQ9+7tl6o
 xTyT3ZE4Bh6Bsm8DMjn9hCClDP+dGgCgp3OpCPgIMUpJYDISPu7P5YWKtEGALQQ7/hMdfZdPy4A
 zkmYbYk7bNB5HWhr79yAQdCQ/MmiB0ycVxsmb1RTO9WD0fzHFdrvOAoZ4thsuk6yaKA7fbLuheO
 H/01hycfAfBsB5Q8a73Z9QveDxJ0wHw3aNA2RB0m87kKa8sm9L+8VPxuALyzQF+DpYmmrsA0ETw
 E0+M3eHahCO76aw=
X-Received: by 2002:a05:6000:40c9:b0:391:b93:c971 with SMTP id
 ffacd0b85a97d-3a094058683mr4165657f8f.20.1746176447970; 
 Fri, 02 May 2025 02:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm25j0Nsvu5M2HoQeEQs5LoUFhkGNDq1rFjU+ziHrFWu39A0tvrGRqLp+V/+6SpRaTrYubsQ==
X-Received: by 2002:a05:6000:40c9:b0:391:b93:c971 with SMTP id
 ffacd0b85a97d-3a094058683mr4165631f8f.20.1746176447641; 
 Fri, 02 May 2025 02:00:47 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20a65sm82883545e9.32.2025.05.02.02.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 02:00:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 1/2] rust: vmstate: support varray for vmstate_clock!
Date: Fri,  2 May 2025 11:00:43 +0200
Message-ID: <20250502090044.85557-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502090044.85557-1-pbonzini@redhat.com>
References: <20250502090044.85557-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7at4ZKkcEkpvR7t-nhYQ56WeLH_X86IJqo3gnff5qxA_1746176449
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 02 May 2025 09:00:55 -0000

Make vmstate_struct and vmstate_clock more similar; they are basically the
same thing, except for the clock case having a built-in VMStateDescription.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 7d9f3a2ca6f..98152e5964d 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -506,7 +506,7 @@ macro_rules! vmstate_struct {
 #[doc(alias = "VMSTATE_CLOCK")]
 #[macro_export]
 macro_rules! vmstate_clock {
-    ($struct_name:ty, $field_name:ident) => {{
+    ($struct_name:ty, $field_name:ident $([0 .. $num:ident $(* $factor:expr)?])?) => {{
         $crate::bindings::VMStateField {
             name: ::core::concat!(::core::stringify!($field_name), "\0")
                 .as_bytes()
@@ -515,7 +515,7 @@ macro_rules! vmstate_clock {
                 $crate::assert_field_type!(
                     $struct_name,
                     $field_name,
-                    $crate::qom::Owned<$crate::qdev::Clock>
+                    $crate::qom::Owned<$crate::qdev::Clock> $(, num = $num)?
                 );
                 $crate::offset_of!($struct_name, $field_name)
             },
@@ -526,7 +526,14 @@ macro_rules! vmstate_clock {
             ),
             vmsd: unsafe { ::core::ptr::addr_of!($crate::bindings::vmstate_clock) },
             ..$crate::zeroable::Zeroable::ZERO
-        }
+         } $(.with_varray_flag_unchecked(
+                  $crate::call_func_with_field!(
+                      $crate::vmstate::vmstate_varray_flag,
+                      $struct_name,
+                      $num
+                  )
+              )
+           $(.with_varray_multiply($factor))?)?
     }};
 }
 
-- 
2.49.0


