Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgPWT-0004c1-IH
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 09:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgPWR-0004Yt-Mk
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 09:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgPWQ-0004Yj-4A
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 09:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738939197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kBAuUoUPVP2WG2hJX+48568E2xfoRBu7145/uvULUPA=;
 b=jB+wXKCXf+I75KosBHMFiL4colsHq94goSX/Mlspvo5Ehdbe6KHjvhlAdw40DN360GM9E7
 KHykODevW4C9Iowtx7hzMhrTsh5xIdlz9Iu1z0ihak7Xs+hjefEGJzbBHktxsbmjHdG3XR
 O99OapJmmTvcJHlThoc9/lwSK98UMmc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-pE0Q5W9gPKG582o_3906sQ-1; Fri, 07 Feb 2025 09:39:55 -0500
X-MC-Unique: pE0Q5W9gPKG582o_3906sQ-1
X-Mimecast-MFC-AGG-ID: pE0Q5W9gPKG582o_3906sQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so240623666b.1
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 06:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738939194; x=1739543994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kBAuUoUPVP2WG2hJX+48568E2xfoRBu7145/uvULUPA=;
 b=j3ppn+nGiBE8ZKiOzVyoFlgysQ+GnmD0bzvPAE41ulEP3nPr+8G17Iw1v4gmgUCVZ8
 HNhMj5Mjj4YKS0XfxVOpVj6VJq6RqtkFbeoQyIrka7sutiXGC8MT2Ndk7PM4iGnCvNMj
 WUbeQ2aVq4lavrFVPuGnEvmtr/W+C1y9OmufF7vtvApizVb6ZfpRirdwVC8NDw/sRntq
 rm9OB8elefKrdNhpIMzVGLZnTM5xRNk/MXtlFdWG70DMqzxvvuRcwt7jJD18biSHFMyv
 TkMjwaI7XhJE9KiJgS6Oup1vXz+h5p86itcnYbEQXauvubO6GRzzCETb3DpvY32WCK11
 pzVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxhpo4y0/8HL7wzQc/QOBmiaF/TEFNpD8tbEz/xqztEou6Z4z4XukkUNZ34sDZXofGzYGKaSyznts=@nongnu.org
X-Gm-Message-State: AOJu0YwT218NpHjp28jU+wz499szj35YY2YPbR5/XTt/LHUGpID8+XWq
 0hwCebrVc9JUfX1LlC0tK3V1bDBY55lEcBA/l/K1h6A7Nye6Wb9+dhMRzMGQnoqwXHsyfiAsefE
 iQEJ/aBdY70zYkYA/1rwA7kVEtWY5743gMhAlT/dlATt0f5ZmLOY=
X-Gm-Gg: ASbGncumUXP6gCY+YAMptKYeNKNTLU15gAC/acaIJ5PP0qR1QMsjEfGNeatR1aY5CdK
 8Ypj7mkRShEC58QZ7GprlJEBEZDJ3RfZhcsvFOacKC2dCctLuHA6YtiIbpTaQGKDKvnaVhX3YJn
 arH2ikDA0tQumi/4HzrGV5TpaocXZMKCXN0HaTHQBq+JCiTkW2RFA/ZhxnWb7FSnR8tPdc1wZmR
 +YPIVQC7Zfc8AZWAP0MPUiX0SqXpXPGjYpUumlBu4sc8DlbWnFB+ztj3u2ksE7c7WQT1R0D1npT
 +/9+sg==
X-Received: by 2002:a17:907:2989:b0:ab7:844b:fcf2 with SMTP id
 a640c23a62f3a-ab7844c0063mr306980366b.6.1738939194063; 
 Fri, 07 Feb 2025 06:39:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhSCcd3SvV7BrIzTgJaA/OSa0qP3qY8f3hr52KRwrUh+Jh+dw81kUC35ZBcBxblwZQr7lLBA==
X-Received: by 2002:a17:907:2989:b0:ab7:844b:fcf2 with SMTP id
 a640c23a62f3a-ab7844c0063mr306978566b.6.1738939193746; 
 Fri, 07 Feb 2025 06:39:53 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78e82cc0csm98185666b.12.2025.02.07.06.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 06:39:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH] rust: pl011: use default set of lints
Date: Fri,  7 Feb 2025 15:39:51 +0100
Message-ID: <20250207143952.2486587-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aAFnF5x1VcYW00f6r15vmvEWxBxEMVz7MU-2NPmyqmc_1738939194
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Fri, 07 Feb 2025 14:40:00 -0000

Being the first crate added to QEMU, pl011 has a rather restrictive
Clippy setup.  This can be sometimes a bit too heavy on its suggestions,
for example

error: this could be a `const fn`
   --> hw/char/pl011/src/device.rs:382:5
    |
382 | /     fn set_read_trigger(&mut self) {
383 | |         self.read_trigger = 1;
384 | |     }
    | |_____^

Just use the standard set that is present in rust/Cargo.toml, with
just a small adjustment to allow upper case acronyms which are used
for register names.

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/lib.rs | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index 88452dc888c..1bf46c65af2 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -12,16 +12,7 @@
 //! See [`PL011State`](crate::device::PL011State) for the device model type and
 //! the [`registers`] module for register types.
 
-#![deny(
-    clippy::correctness,
-    clippy::suspicious,
-    clippy::complexity,
-    clippy::perf,
-    clippy::nursery,
-    clippy::style
-)]
 #![allow(clippy::upper_case_acronyms)]
-#![allow(clippy::result_unit_err)]
 
 use qemu_api::c_str;
 
-- 
2.48.1


