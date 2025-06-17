Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uRRPH-0002v0-Bt
	for mharc-qemu-rust@gnu.org; Tue, 17 Jun 2025 04:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uRRPE-0002ud-Pb
 for qemu-rust@nongnu.org; Tue, 17 Jun 2025 04:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uRRP9-0006ZJ-Ex
 for qemu-rust@nongnu.org; Tue, 17 Jun 2025 04:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750147844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9EqfbV+ZHm5ARvX1NQiJALdFzsoUm+xQx0JBZ3DOigg=;
 b=CFholRm2F2DSWqv5FU20pAmGhKJRP3zx4Q1Dr7gq+xIqXkw2Gzh/13fIK221+yUW1MjOdn
 4i4YsjYs0vNtPhf2rer4jOCb47OsSZw4qLftKwFVfJ/TbA5+0sYSCGGlJuCXkVVKoN1heL
 31CS6+vO8lUYnPvt6CQnJZ28SDEDdms=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-zzcoVtE9PIySQk8w5yT0UA-1; Tue, 17 Jun 2025 04:10:43 -0400
X-MC-Unique: zzcoVtE9PIySQk8w5yT0UA-1
X-Mimecast-MFC-AGG-ID: zzcoVtE9PIySQk8w5yT0UA_1750147842
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451ecc3be97so26566975e9.0
 for <qemu-rust@nongnu.org>; Tue, 17 Jun 2025 01:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750147842; x=1750752642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9EqfbV+ZHm5ARvX1NQiJALdFzsoUm+xQx0JBZ3DOigg=;
 b=GtjADHhaIMjG+EyQW0BK4iWkrJRstduCXDP19vkOXotnDPczBBEArjJ7jX5Sy2NYvB
 Jpw1zXB1GzkX4CGPdkWAgCpMcucCNTVoVDHqDUtVyOrnA4elUtEDi/eEqyahJdLyNWJH
 tuUgE5LzjI5T97jtnQC/0p/elRHTcOPAM9fEvK6kFzPYPOkFhlGtl5j2xtQLntkiH+Xm
 ibUzQS8mtLEdpiTwPimTLCBEAPCaEIutkPdASrf6N9nf/GZWistEbwLU+cmanEhakQoS
 qvxe1DCGEPQ+wx/yxi7D+j+IMFXFY6xbuzodscXhVIhfXU3ERy5eaLcwC8sIen3DA7Lk
 wvXg==
X-Gm-Message-State: AOJu0Yx9zN5FxRKBhccbxAD/7udwT6bNJoibH11nIKPR9ADz5pP2pOho
 wS5zA7Pe24X0MNur0urfEDZ3dS6vEBnErABEejl7GxoOMeSK6XCQYQ9sRPCFgiIAaV/nGSjwjwB
 1oeCOCa/RMfK7WZfMret5QV2PCSZQzztjR18iostKOzP6i9YMBbD0YXE=
X-Gm-Gg: ASbGncutsLaMtQSt6na8YGFhyBxuW9/9S4YYpfuyq3GXUQJofwx9kpH+z8ILS5dbLK9
 Fz6/8LuSH7kfFjAaQuedcXMSaXNJ3z2f8wVQhLYzF3EipQNDayf4XmWwerR/PhYQqNWy7ot5Y2i
 xhZryCA6aMaDfFtwxT5MVapbN3j5HzUOVTf6V3hcexCdpbuI2xRnFc/+wEotYgEtynhAhIE2/Ul
 z6ip1+z2VzkGGOCi19j/WSlEXFzGGcd1onG3aWqyMgTZNXRjILv+JrpqSYaO4NBG2g14EKE4aaV
 lWdeQpLCpBXqXLkWxHrkXXYW/N0=
X-Received: by 2002:a05:600c:3541:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-4533ca42734mr112478695e9.6.1750147841942; 
 Tue, 17 Jun 2025 01:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBdAr8uvb+XUyOoOSR5kwqZgLdgJvV7x8P+QD7Svoi6KrGv5Az22SOcWP3si2GDFkX/84LYg==
X-Received: by 2002:a05:600c:3541:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-4533ca42734mr112478375e9.6.1750147841553; 
 Tue, 17 Jun 2025 01:10:41 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.88.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532f2ca228sm169414965e9.13.2025.06.17.01.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 01:10:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, stefanha@redhat.com, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH] rust: hpet: fix new warning
Date: Tue, 17 Jun 2025 10:10:38 +0200
Message-ID: <20250617081038.115099-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HBKDb7z8JYaK6n4UHPzM7ca_7oMZrKoFud6xkv8Z27Q_1750147842
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 17 Jun 2025 08:10:57 -0000

Nightly rustc complains that HPETAddrDecode has a lifetime but it is not
clearly noted that it comes from &self.  Apply the compiler's suggestion
to shut it up.

Cc: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index a281927781e..acf7251029e 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -771,7 +771,7 @@ fn reset_hold(&self, _type: ResetType) {
         self.rtc_irq_level.set(0);
     }
 
-    fn decode(&self, mut addr: hwaddr, size: u32) -> HPETAddrDecode {
+    fn decode(&self, mut addr: hwaddr, size: u32) -> HPETAddrDecode<'_> {
         let shift = ((addr & 4) * 8) as u32;
         let len = std::cmp::min(size * 8, 64 - shift);
 
-- 
2.49.0


