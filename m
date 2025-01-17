Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYidH-0002Yf-IB
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidF-0002YF-M9
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidE-0003Pq-5W
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737106031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQ+sUuwc6C6WWkzJforxNjfkV4dPtivna2iSl2/kOD4=;
 b=RoicWiEEoIR9/dkFsqK36nQZLR0zNabg8k7iQ92K+rx9B8I9Giqvqn05gdB19Q26Y9K98C
 ROvuvAYYz6HmF4Ow1fdsTm8pFvArnZCXO2G+mDLa4sl9fcVlWVQa5ucDB7oPtgbdP82/QY
 Cr3W5Y7DXH1HjtTs9kG1/7ndV1G+Sbs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-NtwjpQ6JPXaA_5O_lCXoyg-1; Fri, 17 Jan 2025 04:27:09 -0500
X-MC-Unique: NtwjpQ6JPXaA_5O_lCXoyg-1
X-Mimecast-MFC-AGG-ID: NtwjpQ6JPXaA_5O_lCXoyg
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-aa691c09772so167084166b.1
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737106028; x=1737710828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQ+sUuwc6C6WWkzJforxNjfkV4dPtivna2iSl2/kOD4=;
 b=lIMgybPFwe92mO6AP4QTx2TMpOELOLUk+GVdRt7I4M7QJSzmu+iunqaNy2oJN93hIz
 gDWZKpH8Viur5F11+8Vh4a1wyJsmZ9z3+CzdT8rhnFjRnQsRU5CbFanruYxyxlVfQZMl
 3bys23Wj+KMGGHz2jEe1JJN3f80yJrYRZ2qq3OTx5/ZDPmyGSSfuHPrhPQhR6zxYiKqp
 6UYpzX0AWgBic5iQIecUJ+5f1BK5vvRnDAJ+O78PATrs2y6PnbPB+3E/9KM1qP7IeDi+
 rENJ2mNfXtAQlTvPqr7kKuz/2UpGaqRTLjU7TovloZTI7f6X+ictbpqJXRQDZ+AX0BZb
 nqJg==
X-Gm-Message-State: AOJu0YzVQuMiykJgJwzYySteYx0kxgs6ACnkydvxiGnnpZH2GCkH0gI1
 UYBsHwNAXD+XBh3aQsF1zMdTStinySPHTNC19HG+1yC1I66d3h7mRyEtBsdYnLp5i9YmLnpHLCd
 7SbRlTehH2lPjyB88vAZTbhzKN3qWksjP1mHjNxTxPWONYRxtA9chnais/vt9og==
X-Gm-Gg: ASbGnct1R+JP/COfxT96tdZ5dX8QL29riuqjGRowER04yS5WhLsORDJWLLFuiqcJS/G
 b8IbmOEsyLpp6zyt20jHhg3mGWFazF++AnAmek6U5/yZAXlnKRVn3Q3K7hSCeiGhCpbrHWLwqSt
 22oc8Qf3ZsMyKdqM+r6h66v93CrweZzdsj5SBqSArzmWbGP91G1FtYY2jk4QE2vWm/xYCRsK/Cz
 RfoVl/mnNaGaksO1u6wTrWrWx1I/+nmC54IQKJFSah5469tRluvF2xNiY3m
X-Received: by 2002:a17:907:2cc7:b0:aa6:9ee3:e51f with SMTP id
 a640c23a62f3a-ab38b377762mr207322366b.41.1737106028252; 
 Fri, 17 Jan 2025 01:27:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgFxSLGX9Q61z3o5ZA4AS2wJlP8GSEz8jJmPmXVBKvBnkZo5ZLjwrAObdov9L/LckRkqw2Gw==
X-Received: by 2002:a17:907:2cc7:b0:aa6:9ee3:e51f with SMTP id
 a640c23a62f3a-ab38b377762mr207319966b.41.1737106027825; 
 Fri, 17 Jan 2025 01:27:07 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384fcec76sm136223366b.184.2025.01.17.01.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:27:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 04/10] rust: pl011: extract CharBackend receive logic into a
 separate function
Date: Fri, 17 Jan 2025 10:26:51 +0100
Message-ID: <20250117092657.1051233-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117092657.1051233-1-pbonzini@redhat.com>
References: <20250117092657.1051233-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ADIxh26Rhwe1Vd3fOfA_zFUAcqgzupJijckpiLcDimk_1737106029
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
X-List-Received-Date: Fri, 17 Jan 2025 09:27:13 -0000

Prepare for moving all references to the registers and the FIFO into a
separate struct.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 6d662865182..2e8707aef97 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -6,7 +6,7 @@
 use std::{
     ffi::CStr,
     ops::ControlFlow,
-    os::raw::{c_int, c_uint, c_void},
+    os::raw::{c_int, c_void},
 };
 
 use qemu_api::{
@@ -480,6 +480,12 @@ pub fn can_receive(&self) -> bool {
         self.read_count < self.fifo_depth()
     }
 
+    pub fn receive(&mut self, ch: u32) {
+        if !self.loopback_enabled() {
+            self.put_fifo(ch)
+        }
+    }
+
     pub fn event(&mut self, event: QEMUChrEvent) {
         if event == bindings::QEMUChrEvent::CHR_EVENT_BREAK && !self.loopback_enabled() {
             self.put_fifo(registers::Data::BREAK.into());
@@ -505,7 +511,7 @@ pub fn fifo_depth(&self) -> u32 {
         1
     }
 
-    pub fn put_fifo(&mut self, value: c_uint) {
+    pub fn put_fifo(&mut self, value: u32) {
         let depth = self.fifo_depth();
         assert!(depth > 0);
         let slot = (self.read_pos + self.read_count) & (depth - 1);
@@ -615,12 +621,9 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
     unsafe {
         debug_assert!(!opaque.is_null());
         let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
-        if state.as_ref().loopback_enabled() {
-            return;
-        }
         if size > 0 {
             debug_assert!(!buf.is_null());
-            state.as_mut().put_fifo(c_uint::from(buf.read_volatile()))
+            state.as_mut().receive(u32::from(buf.read_volatile()));
         }
     }
 }
-- 
2.47.1


