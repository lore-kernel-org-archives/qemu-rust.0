Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvcVd-0006BP-KC
	for mharc-qemu-rust@gnu.org; Fri, 21 Mar 2025 09:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tvcVR-00069l-B9
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 09:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tvcVP-0001LQ-9N
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 09:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742564025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bafnxYzDWd4pjZBXNWnbM/3IoRbrrmSrOXQQcOl8zXI=;
 b=LFwTmtuCEKhYDjI4vZ4SDbZc31pP7FOaGMJ4GuXoTW3ASktEh0+DQa13GIfIMRs55ZYxYw
 0l7TsDM0y3kV1ToydokprQ2g8WGDWw/ANxrSh4aRC/SZf0gAyVhzcCbyQd2kqXxynC8PR7
 CFSVPv4B3htKTn2e6Vm6AXuj0/noY7M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-VeSwIKogP_uW7HKtu-P8tA-1; Fri, 21 Mar 2025 09:33:43 -0400
X-MC-Unique: VeSwIKogP_uW7HKtu-P8tA-1
X-Mimecast-MFC-AGG-ID: VeSwIKogP_uW7HKtu-P8tA_1742564022
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394040fea1so9668535e9.0
 for <qemu-rust@nongnu.org>; Fri, 21 Mar 2025 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742564022; x=1743168822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bafnxYzDWd4pjZBXNWnbM/3IoRbrrmSrOXQQcOl8zXI=;
 b=cqS8M+0ego2GeA+cU90YZXgZ0fH16PpacYbbhMBtfmEiPJxj+c3bZHgkJf7/h8IlDo
 3aK3qX8kWvquAo65Nd8+yIaYUMSRdoINpNt2YiLnPwrOoF6SNmBaYssXz1q7MbF6GhNB
 yzJIkF/5X/IBjJ35NPQcCVpZmeEkJya1EcilHIOm++PjVESXne1LfEswa1BmkusmykrY
 tg9WxdBlbZEQf9XbxhLf4wGi7U1w68sj5fp3Uf50HsDwGSH4eKstL6zGwJ+uACurTXwb
 D1Enm99dNDpwdhqbWLlnjiiQDD59NLfJOchEuenqdZDHAY6JJhI2FtjIy4/9ObxlX14R
 2WFg==
X-Gm-Message-State: AOJu0YyvpP2xqnLgLqrEehcU5cAQ0CbB5D3W5N3w27wsO9OX4scpmYYq
 GvlpZY8BMcAGO5AmfHnGCVlf3DAi6mGH0KA3YeIzA9R3Xr1mH4OTIneOG1//fQy4Ajbjx2oGM3h
 PCI7NRxIO0U5tJZK9QlkJEw5kjZSeNnp8vJ49D08b1JBTVX2tN6jhqdeBSho=
X-Gm-Gg: ASbGnctW2KWiDWCFs7RXp6LXB92TiZWSkruGe5Q/7qooRZRhdOdG4yUUdCK33tKuwaH
 m7Ae9l4n1F2s3C0vXYF3/JeZ5Lsd+MNbe9K2ISo/4GInuwsuFOuX/iknkz0zt17A8wHqmAnNMnt
 8gNeN5PS6agtlqbBXFf1hDb3D1QNvsY5TLPQpp5GXrZpzUhmPIZyUmXP0LxZyTTuheOvWj3OqiR
 zX9rSMbcF9F/GTAULjChZ0tutDECofHt4WAFjdtjrEs5tbM60QD0+XWg1cG84CWutska52vGZvA
 iRdqk2DOEYA3bp/puFU/
X-Received: by 2002:a05:600c:a3b0:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-43d5100fbe9mr20729315e9.10.1742564021773; 
 Fri, 21 Mar 2025 06:33:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdyVdhAo+o+hLDvd8vv8vYukHNK1BkrO74oNazJ2qy1uawHhw/2YbCr5S+yoc70qVGEB5bEA==
X-Received: by 2002:a05:600c:a3b0:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-43d5100fbe9mr20729125e9.10.1742564021306; 
 Fri, 21 Mar 2025 06:33:41 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.194.153])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd27980sm27433485e9.21.2025.03.21.06.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 06:33:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] rust: hpet: fix decoding of timer registers
Date: Fri, 21 Mar 2025 14:33:39 +0100
Message-ID: <20250321133339.116081-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jpl63xCLGn2xcAa8XZ1HqmyGDeWtNzu2pUkFRJf6KTY_1742564022
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
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
X-List-Received-Date: Fri, 21 Mar 2025 13:33:52 -0000

Due to a missing "& 0x18", timer registers are not decoded correctly.
This breaks the tests/functional/test_x86_64_tuxrun.py functional
test.

Fixes: 519088b7cf6 ("rust: hpet: decode HPET registers into enums", 2025-03-06)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/hpet.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index 63c1971f0b5..3ae3ec25f17 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -776,7 +776,7 @@ fn decode(&self, mut addr: hwaddr, size: u32) -> HPETAddrDecode {
             let timer_id: usize = ((addr - 0x100) / 0x20) as usize;
             if timer_id <= self.num_timers.get() {
                 // TODO: Add trace point - trace_hpet_ram_[read|write]_timer_id(timer_id)
-                TimerRegister::try_from(addr)
+                TimerRegister::try_from(addr & 0x18)
                     .map(|reg| HPETRegister::Timer(&self.timers[timer_id], reg))
             } else {
                 // TODO: Add trace point -  trace_hpet_timer_id_out_of_range(timer_id)
-- 
2.49.0


