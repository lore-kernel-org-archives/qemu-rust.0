Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1taGv0-0006vl-VH
	for mharc-qemu-rust@gnu.org; Tue, 21 Jan 2025 11:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1taGuz-0006vE-KX
 for qemu-rust@nongnu.org; Tue, 21 Jan 2025 11:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1taGux-0005TF-QS
 for qemu-rust@nongnu.org; Tue, 21 Jan 2025 11:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737476154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AomZICEblHmS2tRR/TpaOZIzaerzgfZ1jQ2NFE9RpzI=;
 b=GhRZE+tVms1kzeepQRS912uP8YxMdxdnXptQLWcAtrygc1Z+iP5jy6yWGWOhuZOQsRI7ns
 GErpwlOLqdfO8VYl4nBpK/8nGL3IDymGrqhrOj/XIvD0XHbnsW7MWCmVZVyX0/SLQ5H0tb
 O+dFPdER/PwYs55RsfBO2Jeni3Oq2ZU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-etb5WBBUNZm-QRy3OPkGDg-1; Tue, 21 Jan 2025 11:15:51 -0500
X-MC-Unique: etb5WBBUNZm-QRy3OPkGDg-1
X-Mimecast-MFC-AGG-ID: etb5WBBUNZm-QRy3OPkGDg
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5dbaaed8aeeso3652602a12.1
 for <qemu-rust@nongnu.org>; Tue, 21 Jan 2025 08:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737476151; x=1738080951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AomZICEblHmS2tRR/TpaOZIzaerzgfZ1jQ2NFE9RpzI=;
 b=osuiADvBMbSc684gAqSuYlMz03wEM0SgxAa7au84LSf8Cevt6iG0gFKvJNsEeuAfuQ
 budP4On5m4K3B8RefiVRZsTcIX/6SmGsfeRWiCpZeuc2SQplR7rgDN3WBpTd7f/5WEJw
 nqVbnGkgm+AT/jJ6CPvO8KgMG5987UzmgUry0wOANrBkipukaCpSSdbERLhd3zW7dAs5
 Gpq3CDdKsP8Ly3PWE8EnNAxtPFHmUpkQ5L19T7kmGO4NsGVYXTfwAxd7K0WoGpPNi1lq
 yfVErP/Zo+5zcGvzu6p4ioKLQkQu+6CSivm+USNTB7/0/yjbtkvgi0T6CrtHVgQ7Spuw
 fzhg==
X-Gm-Message-State: AOJu0YwDBhnfLlSgBUO2c2cKLkm3MjuU7gf5AgySrxZcr5emceNlEIjY
 Rc499CJeqVtZPQIunbu3l/+VAzOBsgCIb89iNZ2hS5K9NQHoZrWDjefeXOGc6pxPtntdQWJLnTg
 /WqjodhkB6Vv+iYfRJ11MAF1x74yMNfGLzjOx8LPShIl+c9lF63Q=
X-Gm-Gg: ASbGncuk8ePaQ/uHQwRaZdcz48Qpn4t9cx+Chx8zpnIER5G9+vsV1HwfHVtpxgzlaIV
 MIZ7yIWuMZb0GAjLpBrj65lqJFEnVzPJ9QX5g19td/mxgwm69gs5JESt5eEKCnJOMug6wj7d73Q
 /VUa6MxlK5IkNFf6feOQLe5wtE7LA80E/4h5Ast5N07NfsSZzuxmlyh0rtbNPMxMKDzquZuFQTU
 ssz19WlzTlr0FXTeRaljTYrq1lexdeTSJV6KO6fh+900doaGWYdTFrNi9V6YTacdQlBfSuSRw==
X-Received: by 2002:a05:6402:5207:b0:5d9:82bc:ad05 with SMTP id
 4fb4d7f45d1cf-5db7d2f58c3mr16041505a12.8.1737476150710; 
 Tue, 21 Jan 2025 08:15:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHopTWTbupbzDs6KZOqTeKtPALXTbAsTN1hhb51iQQdhQisM7VgB1bsuqHoJ2TupyP7ZsjSIw==
X-Received: by 2002:a05:6402:5207:b0:5d9:82bc:ad05 with SMTP id
 4fb4d7f45d1cf-5db7d2f58c3mr16041467a12.8.1737476150268; 
 Tue, 21 Jan 2025 08:15:50 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73eb5b64sm7102643a12.57.2025.01.21.08.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 08:15:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: pl011: fix repr(C) for PL011Class
Date: Tue, 21 Jan 2025 17:15:46 +0100
Message-ID: <20250121161546.2233086-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GUoxpRNLBJ_hs0IEruvhrIM5lx8Q_CJ1fee-PYa1Aag_1737476151
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 21 Jan 2025 16:15:57 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index c95ab49fd62..4f1080ff19f 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -130,6 +130,7 @@ pub struct PL011State {
 
 qom_isa!(PL011State : SysBusDevice, DeviceState, Object);
 
+#[repr(C)]
 pub struct PL011Class {
     parent_class: <SysBusDevice as ObjectType>::Class,
     /// The byte string that identifies the device.
-- 
2.47.1


