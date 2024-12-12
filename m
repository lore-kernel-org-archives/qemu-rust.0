Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtW-0006pu-Om
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtR-0006ms-4K
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtH-0006mh-Vn
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlSROje/jH4aIG+vHs+aMStbuV+YcJ8QhC20zV8MRIQ=;
 b=TJT7znXASleZYGxAblWRgnfykXqUvEJqSfkR2eZEZb5uaoJxaW208+1oE44TpQcUvKch8w
 wzVcvwtGaXkPKRxUrNxNKBVh9GxGRd9oSrRFRHyYZ5FXUmRVpmsx6hXHfrr/7Tn+v81AhU
 BEagu1j+c8Xz835R2tWo8/rhPq+wJAc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-w7jC56PeNtGggW_b6HOboQ-1; Thu, 12 Dec 2024 12:22:17 -0500
X-MC-Unique: w7jC56PeNtGggW_b6HOboQ-1
X-Mimecast-MFC-AGG-ID: w7jC56PeNtGggW_b6HOboQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434efe65e62so5516195e9.3
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024136; x=1734628936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlSROje/jH4aIG+vHs+aMStbuV+YcJ8QhC20zV8MRIQ=;
 b=Tfp7uG05ARMv36afvf2xqXRmnQbTz8LMVmHLJ0F/GWMsF3+NQoM3BrVfVmiqoxZyOM
 ecNhNDK5qtyC84zs2X0auoiyQqNXPYo8bkaht696K7Mp5nCnlOvvKnS80LG0cCuAASOn
 A/j53PGTT4uPndIFMTfdRMYJobGmaqoKV7a75ZE9LOMhhkQRLlk1QOzkDrkMF/nWvN5A
 hgJZBfgqvQ/xKB2ZaU5p0pXbZgqgXLD9GDpkVaray5/kiGyJTNWOF37sLL844fXOALsu
 R7OBw9H8Q9seIwL8Azbt5hKVRRqxUTXpDJZyOX2tcMjBTX6zYkHqkN5Qb3ynMwloyWlX
 PcGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq6HTpaHquLXNABjkCArV475YCsQoUAKdx3OkMQ/zyfGQKBNtyAmD5gxZMKVFWjWfCNbWsjAQr7Dc=@nongnu.org
X-Gm-Message-State: AOJu0Yzq576NvOmoUrYjJKLD14Zalq/N2WD4Xv54TxhjMAY2uMt/mnZx
 S2N6GxZQrPfJnYoL5NQQeArM2bonqN1WymTWGr6zQcpZy4UiDwLqHvKAL6I2smTR1hcKJDDxldY
 guuqBr69imaw4337ESY9xD1XBttTkWAXEUhBJqKwhxcy5Avx5wM0=
X-Gm-Gg: ASbGnct8bRiLG3O4fXs9c1P17RYMcxEqkaf3jADTDefmZkAthTnO4QBfuVqD12IZks9
 vA0gWQSHYjvOldXf/AUzgLWEpxRi1LxITsPji4hhDxmta0npeeNcXc2gxVEVH4TTqWVraZxQXkR
 3WOwDL5Hdv4qRmiWuTcGxKggD7bN0ggprj8S/CTCgTHzqFR3zhTdEHqIWn9O3ZWUEFs93Tvi+r0
 Nt7osNpW485M+EZ46lNl9Rp2Jw0CFRa3cUBxLdxL2VSmTY5ouZoVUSCkmKj
X-Received: by 2002:a05:600c:4e4b:b0:434:ff08:202b with SMTP id
 5b1f17b1804b1-4361c36f5b3mr66285415e9.12.1734024136054; 
 Thu, 12 Dec 2024 09:22:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsA5q7Fbw+NO+Mi5ht77fAvi9wOGQ4Iwy+WrOa3qRpj3Ln99lbAVYKYkTAluwaRHRWlIHtvw==
X-Received: by 2002:a05:600c:4e4b:b0:434:ff08:202b with SMTP id
 5b1f17b1804b1-4361c36f5b3mr66285185e9.12.1734024135711; 
 Thu, 12 Dec 2024 09:22:15 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec88993sm27906175e9.2.2024.12.12.09.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 2/7] rust: pl011: match break logic of C version
Date: Thu, 12 Dec 2024 18:21:59 +0100
Message-ID: <20241212172209.533779-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212172209.533779-1-pbonzini@redhat.com>
References: <20241212172209.533779-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G5xEugOnjpKmU_5MMUt9XsnEL1LDo5X4cvNNXfOk3K4_1734024136
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
X-List-Received-Date: Thu, 12 Dec 2024 17:22:30 -0000

Check loopback_enabled(), not fifo_enabled(), like the C code.

Also, set_break_error() must not happen until the break is read from
the FIFO.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 41220c99a83..c6a8dbe1af4 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -465,9 +465,8 @@ pub fn can_receive(&self) -> bool {
     }
 
     pub fn event(&mut self, event: QEMUChrEvent) {
-        if event == bindings::QEMUChrEvent::CHR_EVENT_BREAK && !self.fifo_enabled() {
+        if event == bindings::QEMUChrEvent::CHR_EVENT_BREAK && !self.loopback_enabled() {
             self.put_fifo(DATA_BREAK);
-            self.receive_status_error_clear.set_break_error(true);
         }
     }
 
-- 
2.47.1


