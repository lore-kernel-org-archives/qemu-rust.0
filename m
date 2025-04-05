Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u10Pz-00079N-EI
	for mharc-qemu-rust@gnu.org; Sat, 05 Apr 2025 06:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Pv-00078r-Tl
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Pu-0005ty-BO
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743847581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+CY5CveonKo7CWmyzLUAVkunDmtEX2A2L1U4F0vskc=;
 b=iqqzThFAW2iUTGf8sa8wU9HAB/47kjFMC7652dMG1iylrc3Pv+D7qT0+7mXIdnytjdYL2Z
 yqB4TEHtgfDNT7TQXKt/UMaA1Ip7jzX9RalGwoeCIiWIZz8d90mhz86FT7DaWhrjx1/rVw
 H0QRD8wjjd2zgodcmAIzZ0JDbI1kkLo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-6cn75EF1M_m2r8QRrD4djQ-1; Sat, 05 Apr 2025 06:06:16 -0400
X-MC-Unique: 6cn75EF1M_m2r8QRrD4djQ-1
X-Mimecast-MFC-AGG-ID: 6cn75EF1M_m2r8QRrD4djQ_1743847575
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ce245c5acso34228945e9.2
 for <qemu-rust@nongnu.org>; Sat, 05 Apr 2025 03:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743847574; x=1744452374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+CY5CveonKo7CWmyzLUAVkunDmtEX2A2L1U4F0vskc=;
 b=pcsN+WwsG0qOGzSd8eUdAkjpmrDpGWO+maJu8z037zE8n18OwZJFSV3IheBP8WSSta
 rBAn8LTWAb06Dxqe8iKptld2m1AiHGPwoTG2eBbd+OmqUKpTAFsxQX/ZJQzWm4eAdp26
 4VVjcT2qnGb7lUIRJy1/0X/YcXo+hZcOi0z3mS//8122Q+5WWOSqSnnu1rgxWJaQAW6H
 qhE53kOgeIqLEbF5dnAsPLLZISpVmwEgkoMTgU1dUAWfTMVobNo97uEzPABoGvFyAWYo
 pNRjVbhnGcnJujK1xT8sLrlQ+YhxDMu4So4t/A3kPXRdcawLut4xBZj2f2572dF50E/q
 WLMA==
X-Gm-Message-State: AOJu0YybL0/8OdXaoFIM0gSJSPS3E5pZEcFD6drGnSJd5gm1cwEmHLQF
 FVVBsMu+d8BlmiDoWMraZ/aThTk0AabgTJmNFp+sCeY+MGC8347rTdHGvX6ElXSmqLiH1O3/X7v
 NLqhaBeeDRN5ARvsSmER37EWPzWRZq2ISCFXdf4OJ6DMkPDrKoR+BI/ZWpXM=
X-Gm-Gg: ASbGncvbEAPgrhHWr2UpO8Mgb6aH1FXSUnvxSV/rIrTvR9OoJo5xw58I7xWjo0Ppi9f
 RIeRkkGnSFR2S2PzdVdRJyFSbpqMcBGmh5OcAY6++8ERIw2zqWKjhtbks51ivLkks+0oFxs4+oL
 u7F/YxRty04YDOPK2GXASboO+5gJxhNea4kwWxylU2dCTNv/9q9mb5cjPGobXMiFyz0I4D90o1M
 o8qfzl9EMYJsTWp+irkd7btaFd2mrT6PhmzqfzDq/4qcJcXCymStB0ko5olK25/evfqzQC0Fx+q
 Z4+McjdM3oodL66S9A==
X-Received: by 2002:a05:600c:4f45:b0:43d:7588:6688 with SMTP id
 5b1f17b1804b1-43ed0bc8db0mr57683005e9.12.1743847574330; 
 Sat, 05 Apr 2025 03:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBsJOk8rj9MLj0V7b4tIP01ZxaS8FB506z1sQ+AQ07CjHSmQdux5aDECfP96KRjf7/evRKQQ==
X-Received: by 2002:a05:600c:4f45:b0:43d:7588:6688 with SMTP id
 5b1f17b1804b1-43ed0bc8db0mr57682855e9.12.1743847573960; 
 Sat, 05 Apr 2025 03:06:13 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.96.77])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096ed7sm6299833f8f.8.2025.04.05.03.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 03:06:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/3] rust: cell: remove support for running doctests with
 "cargo test --doc"
Date: Sat,  5 Apr 2025 12:06:03 +0200
Message-ID: <20250405100603.253421-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405100603.253421-1-pbonzini@redhat.com>
References: <20250405100603.253421-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oseEh4AGDPC7T28xLwqs--XeeobDb03MR-DNg2lIo7Q_1743847575
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.028,
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
X-List-Received-Date: Sat, 05 Apr 2025 10:06:24 -0000

This is not needed anymore now that tests link with libqemuutil.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/cell.rs  | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
index ab0785a2692..b3d68bf4a0d 100644
--- a/rust/qemu-api/src/cell.rs
+++ b/rust/qemu-api/src/cell.rs
@@ -225,27 +225,23 @@
 
 /// An internal function that is used by doctests.
 pub fn bql_start_test() {
-    if cfg!(MESON) {
-        // SAFETY: integration tests are run with --test-threads=1, while
-        // unit tests and doctests are not multithreaded and do not have
-        // any BQL-protected data.  Just set bql_locked to true.
-        unsafe {
-            bindings::rust_bql_mock_lock();
-        }
+    // SAFETY: integration tests are run with --test-threads=1, while
+    // unit tests and doctests are not multithreaded and do not have
+    // any BQL-protected data.  Just set bql_locked to true.
+    unsafe {
+        bindings::rust_bql_mock_lock();
     }
 }
 
 pub fn bql_locked() -> bool {
     // SAFETY: the function does nothing but return a thread-local bool
-    !cfg!(MESON) || unsafe { bindings::bql_locked() }
+    unsafe { bindings::bql_locked() }
 }
 
 fn bql_block_unlock(increase: bool) {
-    if cfg!(MESON) {
-        // SAFETY: this only adjusts a counter
-        unsafe {
-            bindings::bql_block_unlock(increase);
-        }
+    // SAFETY: this only adjusts a counter
+    unsafe {
+        bindings::bql_block_unlock(increase);
     }
 }
 
-- 
2.49.0


