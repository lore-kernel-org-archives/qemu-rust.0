Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJxix-0005g1-K4
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 13:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxiw-0005fZ-7J
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxiu-0006h2-Bs
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748365459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MaRtQvyQVdxiccHruMjcY+PBk/KP5Z1xfXXYJBauOQ=;
 b=f7umCGobV4r2FLC9KtNeLO9rfDhAj6yz+UOyRSgbMthXlx/VggIgeQenHEE7drKblTaype
 FZbiz/iPnFmsdhd4V04qK9CRV2td0DZe5PXff1Vp9TRHlxAzSQIC5CcFaV5VURGFhvpBbX
 l7tdnQGbcuZHMqW//qR4a3Eix0LfonE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-CO3AK6gXOle1Acutll-GHg-1; Tue, 27 May 2025 13:04:18 -0400
X-MC-Unique: CO3AK6gXOle1Acutll-GHg-1
X-Mimecast-MFC-AGG-ID: CO3AK6gXOle1Acutll-GHg_1748365457
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ad5271a051eso339087166b.1
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 10:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365457; x=1748970257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MaRtQvyQVdxiccHruMjcY+PBk/KP5Z1xfXXYJBauOQ=;
 b=Cu89Lnddn4+e/cVAW5eRVfQTYIrDwVT+YoZb4w3QGX3oqSm3jcXCktUzON1jkZxEoS
 bOCps5es5ON9nVEYb+mc6BE/t1OGzqeDYA+e8ojOiF44JBoK5HnYmRPTtgjQ9prWHWOU
 COYsayidcZPNYOwsZ6gIQJ/hDAUF7zcdWCUgR8UYIQMuTy3E3JT7JDAbkkJhN+ZMzWAj
 NudGooLoZjV2xfKNDqFplevMcKTL2UQLAnKpU6DskLUjQmGer31yZbxhZG0RnDvp4srS
 BaMq3HVovKrzwqciuDIIp0GnDVVY2Gy+DQAFJ+GqvMdvHSDCwKnN0g8gq73Yo3CwIa7O
 e4nQ==
X-Gm-Message-State: AOJu0YzVVDSG/SNTgsd+KRAEl7lbSrKzc9NZB97aswsbT85/MiSeV5H5
 tcyWiLmEtlPZ0ZeP7DJXwLENljAvXyIQC7Kcf+yrvfXFSlGE0Wl+tbprwO5AWbQTuHh80L4MIyf
 pt10FyUtdRKOZy2S3hvPL+4uxqiWB4FBwzqN/nYKVlWRr85H4y3KO9Ps=
X-Gm-Gg: ASbGncuVDcq3xMeuVAQ6nUtPg2VqqoGFO+di3P+SdSVMEaXFLwDnt/6BCfGRFtC8eQj
 2jnh+RNHLe2Lw9uTud/JPy3/I2KiGb9OMWdCCiaBp9pn7KKdVkX3VFzMZuuE60J1CEOLJb7bWP5
 nONjGRJx3A23KsyUC3F3gaAm1lfZi4D6TXCFHcYFORmiI2zk/exwUey0ETI7pnKjo3KNZ97e1q+
 ZSBk/mMv7Oz/i087OoTgpi/lZGpxQ1ByQjb4rybf/yrIlxGTp033Nu2skPEZ/xFVAiCyfSuVQvv
 16zKA/m/1mLS2Q==
X-Received: by 2002:a17:907:d716:b0:ad5:6b8a:a0a6 with SMTP id
 a640c23a62f3a-ad85b319ab8mr1346044566b.58.1748365456470; 
 Tue, 27 May 2025 10:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/I/4u//Q0qm0idcjRPra2TwV54TBZPShO+oKHsdDkuUuySCPF+/QW+NybXVZM/H9yZmKMhA==
X-Received: by 2002:a17:907:d716:b0:ad5:6b8a:a0a6 with SMTP id
 a640c23a62f3a-ad85b319ab8mr1346038766b.58.1748365455967; 
 Tue, 27 May 2025 10:04:15 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d438086sm1864422766b.89.2025.05.27.10.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:04:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 5/6] rust: cell: remove support for running doctests with
 "cargo test --doc"
Date: Tue, 27 May 2025 19:04:03 +0200
Message-ID: <20250527170404.1580482-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527170404.1580482-1-pbonzini@redhat.com>
References: <20250527170404.1580482-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4TWFrR8jPPPgdQMBi4JC-IZ7ECqdhlTDctSk0oNIlYQ_1748365457
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
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
X-List-Received-Date: Tue, 27 May 2025 17:04:22 -0000

This is not needed anymore now that tests link with libqemuutil.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/cell.rs | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
index 05ce09f6cb6..27063b049d5 100644
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


