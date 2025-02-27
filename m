Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnens-0006TY-09
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemk-0003vO-A3
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemg-00047o-5o
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4VqwNYiNiuTUzYwk2y50HzhW9i7JscSTGolkyuQe+I=;
 b=imqEjEnSCbXhVIh9z0VRL8iiUT3//nvX39BJ9NcY2+b6cGc24/DgeXAIUXd0UjxC0KhGXi
 DtGYBl3PQT/DBiLv/mph5MToftT42wMjyTT55jWyFHq7v4+inYEc0ahyQzrBJn74fHQu0k
 IdZB9R6+SxVS55qsA0waVs8rFR3V8rY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-JtBTOWptPV6rPjRZ517AVQ-1; Thu, 27 Feb 2025 09:22:39 -0500
X-MC-Unique: JtBTOWptPV6rPjRZ517AVQ-1
X-Mimecast-MFC-AGG-ID: JtBTOWptPV6rPjRZ517AVQ_1740666159
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-abbe5ac36a9so116655366b.2
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666158; x=1741270958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G4VqwNYiNiuTUzYwk2y50HzhW9i7JscSTGolkyuQe+I=;
 b=gUnfBA2bExXMat05Bt73WBWgXiFbhi24zKy+VeBPNYRQ3hSm9KoV0TB3jjxoqV8Wzi
 HzZMTYSvXMPgpyWczB7RPE5H4UJjoYoxQaDt2jIlf35CCy1nuZXxwpshe3R36J3/uXPX
 TSl0wURU7cJl2wR3OdobPqA0Zn6SfXzv4kL+InUXWLctZUUhd4nXRaUF9Rg0EY14PAaS
 sD8x3vC7f+GcrJ2+Y1zYSCnqe4KCiPhtuNHLnxlMnncOkbgdnbu1XONEe3r6DN/IR3LJ
 0bgJFAgFT/d9iSbLX6dYpj0DsKAgvIjIBKxuLIH6q5Nbg4xeeTHjmkBWBoEULT9wSbg1
 LuJQ==
X-Gm-Message-State: AOJu0YzUyAxIADI96PpH+U84YsmZYY75obWKulkn1VN5ZgwMFkomZkXn
 ADU7nIlwZP3rbwOZGXHe2Qmy47dD605ORC3wiWAAPOMWU9UFNp25aOACYS+v9tMkbnuN4hQq5o2
 wS6vp+gLJNkyoenaTMVfQ2Uaw3h/0YF1+Rx8sKXcMV811zQUMT2XC6BiQ1SpF/w==
X-Gm-Gg: ASbGncuNWwyHMtQKHqwjclUcA5vsh6+c4Y2wE6MV51vyIzVr3SIMv+sPLJibEkfIX4O
 AYoubXn9Ffc5jSloofOYh569FZccRCzoMtWaasiVWHToB8VFwSQCic6ZRg1IcwOEubAZpg0Yzqy
 0Q34TICATwWX0ykrQ1BaMVM3A03FUioexeCfN+7i1A7BldmFMCw2xeoY7ArdeUeXb1wY/+E0Z+Y
 zL6GvdvUKWxluy/aZFQNVoI1gjY3mf6+BwCw6Ml4SejpPugeLMY8EVoak/2zPQT/dkmEt8NhU7J
 1h9/vlchbEnREqYvxQlR
X-Received: by 2002:a17:906:3152:b0:ab7:d87f:665b with SMTP id
 a640c23a62f3a-abc0de4a2cemr2554978966b.48.1740666158123; 
 Thu, 27 Feb 2025 06:22:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvqN1jeEHL8v0Gq8g/eqXy/BrDmOdict2Vquc+f2bkWu2Ri45v5VoKyEwGFyHlGKflr5U15w==
X-Received: by 2002:a17:906:3152:b0:ab7:d87f:665b with SMTP id
 a640c23a62f3a-abc0de4a2cemr2554976466b.48.1740666157672; 
 Thu, 27 Feb 2025 06:22:37 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c7bbfe2sm130718966b.171.2025.02.27.06.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 08/12] rust: hpet: do not access fields of SysBusDevice
Date: Thu, 27 Feb 2025 15:22:15 +0100
Message-ID: <20250227142219.812270-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z0UIjJElFWRDyrsHxp2BmFLbwiOvj5MKOD9IF2178vs_1740666159
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:48 -0000

Fields of SysBusDevice must only be accessed with the BQL taken.  Add
a wrapper that verifies that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/hpet.rs |  4 +---
 rust/qemu-api/src/sysbus.rs    | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index ce4b289d0c8..a440c9f4cb9 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -724,8 +724,6 @@ fn realize(&self) {
     }
 
     fn reset_hold(&self, _type: ResetType) {
-        let sbd = self.upcast::<SysBusDevice>();
-
         for timer in self.timers.iter().take(self.num_timers.get()) {
             timer.borrow_mut().reset();
         }
@@ -738,7 +736,7 @@ fn reset_hold(&self, _type: ResetType) {
         HPETFwConfig::update_hpet_cfg(
             self.hpet_id.get(),
             self.capability.get() as u32,
-            sbd.mmio[0].addr,
+            self.mmio_addr(0).unwrap(),
         );
 
         // to document that the RTC lowers its output on reset as well
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
index 48803a655f9..0790576d446 100644
--- a/rust/qemu-api/src/sysbus.rs
+++ b/rust/qemu-api/src/sysbus.rs
@@ -64,6 +64,18 @@ fn init_irq(&self, irq: &InterruptSource) {
         }
     }
 
+    // TODO: do we want a type like GuestAddress here?
+    fn mmio_addr(&self, id: u32) -> Option<u64> {
+        assert!(bql_locked());
+        let sbd = self.upcast();
+        let id: usize = id.try_into().unwrap();
+        if sbd.mmio[id].memory.is_null() {
+            None
+        } else {
+            Some(sbd.mmio[id].addr)
+        }
+    }
+
     // TODO: do we want a type like GuestAddress here?
     fn mmio_map(&self, id: u32, addr: u64) {
         assert!(bql_locked());
-- 
2.48.1


