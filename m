Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtY-0006rA-VG
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtS-0006nZ-Dy
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtN-0006nL-LA
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QK+lsN9N8GKnH3zKNE8BJxFeo8zX1mw/5X/o/AQc7oc=;
 b=NL2JveZURHZS7cuGp/ga+LvlXl+syMZInPjXzWKrJ7HZFU1RaXUEdt/TkJbUFgybnAsVox
 pkWF0SCc8bkGUEEpKL0DYEQpfXWVs9rjJhaot/XYwJRcoT7aiQTzK3cj+VtH1y4CUk8rwT
 egxFzIyFH8BthINyjgcLs2aQf2o5BLA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-YP6JO_IXONS0Gndvpt3s5w-1; Thu, 12 Dec 2024 12:22:23 -0500
X-MC-Unique: YP6JO_IXONS0Gndvpt3s5w-1
X-Mimecast-MFC-AGG-ID: YP6JO_IXONS0Gndvpt3s5w
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4362153dcd6so5430935e9.2
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024142; x=1734628942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QK+lsN9N8GKnH3zKNE8BJxFeo8zX1mw/5X/o/AQc7oc=;
 b=B1vpTpwXdmSAi+DntFh8YOl6FKbaQQWWCrYFRFayfqkReDAQEL7ZSJNXbS2dn/xTHc
 LxNnpSvTrRYdUhibG2YcmJ72dDZdqWgEgx2zxtuNT0tXNgO+bmCfSdIfdGtqSsfKOIGU
 MufthcXJcdrgTJ9j4oJmdrUh2KzazxlM9EyB6jUjxxshVdU6qbWQZsC1XqB0UqD5y9K/
 hVWc1gPldUCLiU60vxa2JZEzka3ISxDURys3Lavb+tY95TzRU6VUZc7NUco5pWm7hyxV
 L2vxheI159whmuwuATI4IFvx7WQW0xwzWuC+tDNLti3iiH9SI985O8B2avd8ulpD9INv
 Y+ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjByhZcGZEMe+q6tDUhPmSGL2rixqstxBLcnv4FAcp84i9fK8Zmlf0kdLQmW0/T6ieHwSEeYLdBC4=@nongnu.org
X-Gm-Message-State: AOJu0Yx8QcL4SNiuuIInK9LEZnJdH3XN87mf2yvVEADjs9HbEgSjGmFc
 e6wFoPMZGlI1Lj+oA18mIIB+n+zVcYL4oKIo6JHSRMM3jQrECg7Epr68Nst0xxtHe3sCM3Rrhee
 jImFXI5l75lSpQaCzCNBD4dHjeQcJKOTVuNiDQFs4+NBFTDrxeaU=
X-Gm-Gg: ASbGnctIU/uOjKuSmHvWv7ZlqyD1P2zGFjf7Lao3OR63HnRHTYgrkf1FC6x0SSj2LxZ
 AwH1nc866jduWilLb2jjDOTIDe4jHcl1c5dm31VBwoLgxsPA7AzT/qAISN5M3rNkTQ/UPVEQ9h2
 TtyEpoCiLWnD6kpRzEACVoitaCZZiimk+hvlc4ndX+zDmtKjBou/4FW6Mz/RTQe96DzQe3qStZz
 VOHjLA4wZsKxvEtj8XWS+JuFyV61XF/RZY01qxpbubAT57tGFl1ZkYGkHiA
X-Received: by 2002:a05:600c:4f86:b0:434:9e46:5bc with SMTP id
 5b1f17b1804b1-4361c35cf0amr77607385e9.10.1734024140802; 
 Thu, 12 Dec 2024 09:22:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOALJOSWPkWDyRLWHIqDFZoBkOeAohS1YxP/+7qkyhP9o/3cIaJKip1GqeHKcue6wF83J6kg==
X-Received: by 2002:a05:600c:4f86:b0:434:9e46:5bc with SMTP id
 5b1f17b1804b1-4361c35cf0amr77605895e9.10.1734024138930; 
 Thu, 12 Dec 2024 09:22:18 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec88993sm27906505e9.2.2024.12.12.09.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 3/7] rust: pl011: always use reset() method on registers
Date: Thu, 12 Dec 2024 18:22:00 +0100
Message-ID: <20241212172209.533779-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212172209.533779-1-pbonzini@redhat.com>
References: <20241212172209.533779-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 77TDk6tpnoZgJVSwDp3El6ySNTRZQuQ4AQQ0aG-cXhU_1734024142
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Thu, 12 Dec 2024 17:22:32 -0000

For CR, the ugly-ish "0.into()" idiom is already hidden within the
Default trait.  Do not repeat it.

For FR, standardize on reset() being equivalent to "*self = Self::default()"
and let reset_fifo toggle only the bits that are related to FIFOs.  This
commit also reproduces C commit 02b1f7f6192 ("hw/char/pl011: Split RX/TX
path of pl011_reset_fifo()", 2024-09-13).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 23 ++++++++++++++++-------
 rust/hw/char/pl011/src/lib.rs    | 13 +++++--------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index c6a8dbe1af4..eb15e9d5788 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -267,7 +267,7 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                 self.update();
             }
             Ok(RSR) => {
-                self.receive_status_error_clear = 0.into();
+                self.receive_status_error_clear.reset();
             }
             Ok(FR) => {
                 // flag writes are ignored
@@ -288,7 +288,8 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                 if bool::from(self.line_control.fifos_enabled())
                     ^ bool::from(new_val.fifos_enabled())
                 {
-                    self.reset_fifo();
+                    self.reset_rx_fifo();
+                    self.reset_tx_fifo();
                 }
                 if self.line_control.send_break() ^ new_val.send_break() {
                     let mut break_enable: c_int = new_val.send_break().into();
@@ -447,16 +448,24 @@ pub fn reset(&mut self) {
         self.read_trigger = 1;
         self.ifl = 0x12;
         self.control.reset();
-        self.flags = 0.into();
-        self.reset_fifo();
+        self.flags.reset();
+        self.reset_rx_fifo();
+        self.reset_tx_fifo();
     }
 
-    pub fn reset_fifo(&mut self) {
+    pub fn reset_rx_fifo(&mut self) {
         self.read_count = 0;
         self.read_pos = 0;
 
-        /* Reset FIFO flags */
-        self.flags.reset();
+        // Reset FIFO flags
+        self.flags.set_receive_fifo_full(false);
+        self.flags.set_receive_fifo_empty(true);
+    }
+
+    pub fn reset_tx_fifo(&mut self) {
+        // Reset FIFO flags
+        self.flags.set_transmit_fifo_full(false);
+        self.flags.set_transmit_fifo_empty(true);
     }
 
     pub fn can_receive(&self) -> bool {
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index d5089f78854..e3eacb0e6b9 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -230,7 +230,7 @@ pub struct ReceiveStatusErrorClear {
     impl ReceiveStatusErrorClear {
         pub fn reset(&mut self) {
             // All the bits are cleared to 0 on reset.
-            *self = 0.into();
+            *self = Self::default();
         }
     }
 
@@ -297,19 +297,16 @@ pub struct Flags {
 
     impl Flags {
         pub fn reset(&mut self) {
-            // After reset TXFF, RXFF, and BUSY are 0, and TXFE and RXFE are 1
-            self.set_receive_fifo_full(false);
-            self.set_transmit_fifo_full(false);
-            self.set_busy(false);
-            self.set_receive_fifo_empty(true);
-            self.set_transmit_fifo_empty(true);
+            *self = Self::default();
         }
     }
 
     impl Default for Flags {
         fn default() -> Self {
             let mut ret: Self = 0.into();
-            ret.reset();
+            // After reset TXFF, RXFF, and BUSY are 0, and TXFE and RXFE are 1
+            ret.set_receive_fifo_empty(true);
+            ret.set_transmit_fifo_empty(true);
             ret
         }
     }
-- 
2.47.1


