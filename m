Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtc-0006tQ-Ua
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtW-0006pr-AN
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtU-0006p0-LC
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSm79oz08FdIlTp31rLzEqSvbz1oNHscAzWwfiPVPzw=;
 b=Bi8Ok4K/FyKMEGTK2LjUZS7i9A+0eb5PM0mz0NTVtUa9e1ReBDiUhw3syPc2V3/SNtXtd4
 o8Q7JtDBCsDFTpXfV7dvKRfLgmE0EsaEzYwj8AJ+7e+VzksOz+TCpw6TYq3zBCQmTc1TWN
 gtMJ12MfiPNIEIMWNO3mqq24ftSAyIU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-qQRbWa2VOq2T2a84_PTCcw-1; Thu, 12 Dec 2024 12:22:30 -0500
X-MC-Unique: qQRbWa2VOq2T2a84_PTCcw-1
X-Mimecast-MFC-AGG-ID: qQRbWa2VOq2T2a84_PTCcw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3862e986d17so414532f8f.3
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024149; x=1734628949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSm79oz08FdIlTp31rLzEqSvbz1oNHscAzWwfiPVPzw=;
 b=kaZ5NTijVKQUaHnrpVRpADD5omQZaTPeTgTctENu/klgMKewJCBlB18UJ66j6fHaeI
 ZpTvwoD/KzKU+zJ0FkwxD7cIR/7SWrldS+avxbqSuXb5zjcGLnBLmff3jxN/z1FL9/nE
 HFZXEGoO8e5pFHfqLBFq8V19M9zp+2okeKohrY4edWf6fgjJYWF4xc+jC0eUburMkpru
 AnMZU0/etC3Au31+nBEtRecPYuvCqG3I2SK6uOGAzgB7YdedpESajk2MsUJfGsrfaC4v
 JEalTuwQ9WIPVBdDxNBL15RsiznwDt8uY7slriRpS7sK78RBfF66EhDtTzs9ovNeYGDM
 PXuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8EbUU8S24yqhoOqcUHmpqt1vtDaWrpDAdj2VJnst0fqJkD8jnLO0MSRXEx0snGYCh7y0zCofMNSs=@nongnu.org
X-Gm-Message-State: AOJu0Yxmm0o9XY+oLdXikQMSGObsISIE4u7HkXqefp6h3B/htyXfupvT
 mSpriUA+QIdlwMP7hA4MdFRz8UOCkQZ4lkJzF3X93GCY50CkWbXor2IKxBP8oIT0o9va2Lq7mUh
 yqZTmtvBjJqPPGkTE3c3lJu5k43JRReaN0kKemtWdvbsSQjQkGPs=
X-Gm-Gg: ASbGnctyp1IbLaUO50rbxTMKvjmOEQEGwxesqear6xRvIbAdMmqhC/dYaVX4aNV2h1k
 VLODUexWO2r2wvaeg1n1fc0kAyDqYBrMmgB4Mf4I+vF1S54SncV035aTWOqGpurnQk6zoCBgSGZ
 WqznbOjVnSc9XfcENWQis02VAs9uPtym8Mt96Tl1iL5ePpOrMhtTotXWbxSX9UpIZ4RUq+9rSl6
 6P4mgo/ftVPtPsAqSux4srR42xRl+bgpAkoTcUKkD5nmW1UBjzx4/b8+1mq
X-Received: by 2002:a5d:588b:0:b0:385:e2c4:1f8d with SMTP id
 ffacd0b85a97d-3864ce96ed1mr6918667f8f.19.1734024149479; 
 Thu, 12 Dec 2024 09:22:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERL4Pz7X8hJNKtOv0Z7DJ23nsR1ReastYOYfmmQ5wyeBe1Qf2yPsHd+ZqVQEJy/Mj+1+eu/A==
X-Received: by 2002:a5d:588b:0:b0:385:e2c4:1f8d with SMTP id
 ffacd0b85a97d-3864ce96ed1mr6918651f8f.19.1734024149076; 
 Thu, 12 Dec 2024 09:22:29 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec87bc3sm37435585e9.1.2024.12.12.09.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 7/7] rust: pl011: simplify handling of the FIFO enabled bit in
 LCR
Date: Thu, 12 Dec 2024 18:22:04 +0100
Message-ID: <20241212172209.533779-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212172209.533779-1-pbonzini@redhat.com>
References: <20241212172209.533779-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4PdlhR5c6Tps5KH76CsEgsZ9ST63vw6_ar24fnxe_nk_1734024149
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 12 Dec 2024 17:22:34 -0000

Use ==/!= instead of going through bool and xor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 6 ++----
 rust/hw/char/pl011/src/lib.rs    | 6 ------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index cfe2734703e..169ff3779c6 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -307,9 +307,7 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
             Ok(LCR_H) => {
                 let new_val: registers::LineControl = value.into();
                 // Reset the FIFO state on FIFO enable or disable
-                if bool::from(self.line_control.fifos_enabled())
-                    ^ bool::from(new_val.fifos_enabled())
-                {
+                if self.line_control.fifos_enabled() != new_val.fifos_enabled() {
                     self.reset_rx_fifo();
                     self.reset_tx_fifo();
                 }
@@ -502,7 +500,7 @@ pub fn event(&mut self, event: QEMUChrEvent) {
 
     #[inline]
     pub fn fifo_enabled(&self) -> bool {
-        matches!(self.line_control.fifos_enabled(), registers::Mode::FIFO)
+        self.line_control.fifos_enabled() == registers::Mode::FIFO
     }
 
     #[inline]
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index 0747e130cae..69064d6929b 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -419,12 +419,6 @@ pub enum Mode {
         FIFO = 1,
     }
 
-    impl From<Mode> for bool {
-        fn from(val: Mode) -> Self {
-            matches!(val, Mode::FIFO)
-        }
-    }
-
     #[bitsize(2)]
     #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
     /// `WLEN` Word length, field of [Line Control register](LineControl).
-- 
2.47.1


