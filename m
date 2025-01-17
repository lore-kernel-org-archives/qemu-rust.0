Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYidC-0002Wk-IB
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidA-0002W0-R3
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYid8-0003OZ-Uv
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737106026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LHIx6YD9KYcmWShWQUyELs6YliSZmQn+Rg6KU2NYAh4=;
 b=LGuk6ldImvV/Qcn8o+BFJsrGNNieYpm0hC1NV8wnYMU5ETN8JdQxOQ6+2HKLI9+vEJrzZZ
 i4d8Ft2bnPEnThMUX0YJgqcNW08reSqpEGOmTFqTYRRAwJdNRuG8DbWNTtYr1XXeIQyQFa
 o7V+GuGCQUboXqtopOko+xyaghhTidA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-LoB-dZJsNC2aNV9BqNIVFg-1; Fri, 17 Jan 2025 04:27:05 -0500
X-MC-Unique: LoB-dZJsNC2aNV9BqNIVFg-1
X-Mimecast-MFC-AGG-ID: LoB-dZJsNC2aNV9BqNIVFg
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aabf8e856e2so174831466b.0
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737106023; x=1737710823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHIx6YD9KYcmWShWQUyELs6YliSZmQn+Rg6KU2NYAh4=;
 b=DQnN//4WReJ0Qq4jqJUIq7yc9vMwPgNNakSY2o49Z9ptQWe1hZG5vs0RtBpCR4L/1h
 M43kulBovlkKwRPwhzTteanATYKyn4QBO4OfBn2qS9wxcweS4zqiyphrUDH5hTbj79ND
 bgEy0mgH3tN5HBl7ZmXn7CihREX1tkuDn0vKwm/MTUXu23/L8PA8PJiM+zZSh9PF84/k
 dhLo+apOUqD1QZE5VAGQSa4AYucHd6cZt37F9TX3Zmb2RIXFtGIif3vJjLVlkT5XfK1q
 ZykZf+7eqYsESK6M1bIn++sGrIhEKb/fVcrNwZvIWHKETgaAFlTUTCNGTn0qixaaJT7f
 naew==
X-Gm-Message-State: AOJu0Ywb5d7HYcoABS8LEEd20yW77/edY6NcGIJJr7NycBsSx2c+yAtC
 nD9NIDRTT31srdPRpOBhsjfX4Qovyc5RWdLrjxC4dz3TAlhSYdNs5og9W8iRjdkKsDkun0b07RH
 YkT2b7Py7bxlL+HvE0g6AHmBFZROlrQBuZsPFdwgbgVitUNneqaWx7B0rCzjK6g==
X-Gm-Gg: ASbGncu00YoubiOPHN4fudX8HKcneRZ6btmzbdQFCnew/8PsM36sUaHKpAJmNyqoNMP
 ZqR7Bzhrmc4wToTu/u+7RgEfx9RVC7KcHLijAa9CzJXsIPAXScc2nfABuf1Z1mSKN7/7n9tWi+K
 v+iEWxe3gfo5V+rW9koX6Loa0bFb1pNuZgp5nX0EEnlrU+1itPyR0yLt4HPHdfM446EhQ6HBgaa
 X8Jyp9LPo+N7kjKlBG3spJ+I6GjnUi4X2K8rI2x4k9+47Alm0y4gLwyExJD
X-Received: by 2002:a17:906:cec6:b0:ab3:85eb:377b with SMTP id
 a640c23a62f3a-ab38b4c6c1emr183550266b.53.1737106023615; 
 Fri, 17 Jan 2025 01:27:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM0mJvtY8pA+DH5mVS/e7Ey0Sz1Ooyy8eupg8JIcJnYdQkWvqa0bYjt8ezufRBrw2WpLuJxw==
X-Received: by 2002:a17:906:cec6:b0:ab3:85eb:377b with SMTP id
 a640c23a62f3a-ab38b4c6c1emr183548266b.53.1737106023163; 
 Fri, 17 Jan 2025 01:27:03 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c74cd8sm139482366b.3.2025.01.17.01.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:27:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 02/10] rust: pl011: hide unnecessarily "pub" items from
 outside pl011::device
Date: Fri, 17 Jan 2025 10:26:49 +0100
Message-ID: <20250117092657.1051233-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117092657.1051233-1-pbonzini@redhat.com>
References: <20250117092657.1051233-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DcoDraS_7Bc92eXoR3wIFXupseKuiWpKMBqn8hULgTg_1737106024
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
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
X-List-Received-Date: Fri, 17 Jan 2025 09:27:09 -0000

The only public interfaces for pl011 are TYPE_PL011 and pl011_create.
Remove pub from everything else.

Note: the "allow(dead_code)" is removed later.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs       |  2 +-
 rust/hw/char/pl011/src/device_class.rs |  2 +-
 rust/hw/char/pl011/src/lib.rs          | 13 ++++++++-----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 11a87664c7a..e85e46ba0bb 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -565,7 +565,7 @@ pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
 }
 
 /// Which bits in the interrupt status matter for each outbound IRQ line ?
-pub const IRQMASK: [u32; 6] = [
+const IRQMASK: [u32; 6] = [
     /* combined IRQ */
     Interrupt::E
         | Interrupt::MS
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index b052d98803f..2fd805fd12d 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -21,7 +21,7 @@ extern "C" fn pl011_clock_needed(opaque: *mut c_void) -> bool {
 }
 
 /// Migration subsection for [`PL011State`] clock.
-pub static VMSTATE_PL011_CLOCK: VMStateDescription = VMStateDescription {
+static VMSTATE_PL011_CLOCK: VMStateDescription = VMStateDescription {
     name: c_str!("pl011/clock").as_ptr(),
     version_id: 1,
     minimum_version_id: 1,
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index d10f0805aac..2baacba2306 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -27,9 +27,11 @@
 
 use qemu_api::c_str;
 
-pub mod device;
-pub mod device_class;
-pub mod memory_ops;
+mod device;
+mod device_class;
+mod memory_ops;
+
+pub use device::pl011_create;
 
 pub const TYPE_PL011: &::std::ffi::CStr = c_str!("pl011");
 pub const TYPE_PL011_LUMINARY: &::std::ffi::CStr = c_str!("pl011_luminary");
@@ -42,7 +44,7 @@
 #[allow(non_camel_case_types)]
 #[repr(u64)]
 #[derive(Debug, qemu_api_macros::TryInto)]
-pub enum RegisterOffset {
+enum RegisterOffset {
     /// Data Register
     ///
     /// A write to this register initiates the actual data transmission
@@ -98,7 +100,8 @@ pub enum RegisterOffset {
     //Reserved = 0x04C,
 }
 
-pub mod registers {
+#[allow(dead_code)]
+mod registers {
     //! Device registers exposed as typed structs which are backed by arbitrary
     //! integer bitmaps. [`Data`], [`Control`], [`LineControl`], etc.
     use bilge::prelude::*;
-- 
2.47.1


