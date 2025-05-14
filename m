Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uF3CA-0003ux-4f
	for mharc-qemu-rust@gnu.org; Tue, 13 May 2025 23:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uF3C9-0003uo-BE
 for qemu-rust@nongnu.org; Tue, 13 May 2025 23:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uF3C7-0008JV-QM
 for qemu-rust@nongnu.org; Tue, 13 May 2025 23:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747194849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xLR8sU1BF5A6HcCAyYFe2oaaAHR40jdW0ueKmStF/tg=;
 b=gvu9iBXw1DVUMgwBkgLWPBrm0QOB+0iA4PnsAHZvIdUTMBt3I/53ZDGJwXBFOZ8zvy9llp
 4wRjDhBw7FE74txWfOQjIeAvbbQfNmUHBzh2eHc1qH6I4GlkVDy6afRmsEirXaUCAvlHgW
 cJCnvEVjnnyd9buzIONMzbmcm0rrCBA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-fUofRPBsPjy9Trq8UT9Ikg-1; Tue, 13 May 2025 23:54:07 -0400
X-MC-Unique: fUofRPBsPjy9Trq8UT9Ikg-1
X-Mimecast-MFC-AGG-ID: fUofRPBsPjy9Trq8UT9Ikg_1747194847
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f6eee4d7f8so87913466d6.2
 for <qemu-rust@nongnu.org>; Tue, 13 May 2025 20:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747194847; x=1747799647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xLR8sU1BF5A6HcCAyYFe2oaaAHR40jdW0ueKmStF/tg=;
 b=ibVtOaOj+mL2YYS6wjMFhq9ud4AgFzvXktiTFV4TYauNIJ9Pxf3dfK21gRuYbt127B
 HIO09vaUi627f40Qc5jPe4VRtU/d2SUCJenmKFIsnjNB5axFk+lrRDPG3guNmp68thwt
 LWT1Z6oouEuGzaH8oPzpXYNljZYZnm0YMhrQZhT/Nnnl4iEa49t7B5QdeR7Szn14Riu0
 2MTZKaPbto7LgBI5bn5SUAAS2J6uli12jp+RUVkQWPI4YvE+HWsvABUBRLKRsAUxu5KL
 DI5eIbHHMML+yIJAq4/PeChrMFuWzaNSuWrBkEly/oviTK8Z/t2Ec5iVYSLoddB7Psn1
 wjfQ==
X-Gm-Message-State: AOJu0Ywf/kLQgUIxXPUFJD0RM3vgcStgDPKWGFYIQBWGJNripfRqcvvV
 QVwXd5ZOVGmK9v34ZuivcJFhxooFnuySY/RfdKkgs2GLqqBubK3b31B6WrKoy0MbwCaIBzTCIU8
 2rtiYdKHEiYKwUEP/xW9naNTb2RrwnzT06nn5rBO2pi4w6/EnLAU=
X-Gm-Gg: ASbGncu4G26bfYUkq8igmmurN1eS9m3EE3bvwz/sNGQozbHD2Ct6urvg7HmdQDmyzz/
 bzsBXnAzauanUoC1EXv6lZWWRA0pjBK7ybESMN6ZQS61/NY7gVgmJy9NqoBY+9/z4KET8ChwJL0
 eUsFImMhxgk+vOKPl6thHxteuACjfZq8pkEpG2GD6AjF7lUCJPzhOYulo9SGRQCW48/war6kV+t
 ThYCBKYKTP5pwgJz+ktdc+1Yf8PztyL/R2utilEpJKo1gOFSX4TK6QpkG8iQpybriWZsX3iRsK+
 ZpXdKDWRMiXC6ca7
X-Received: by 2002:a05:6214:1bc8:b0:6f2:b7d4:afb9 with SMTP id
 6a1803df08f44-6f896e2ee1bmr30069186d6.2.1747194847471; 
 Tue, 13 May 2025 20:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW3/xsSRD46qoyyXTs5q5myJ6g3Lolyb0nKC0BS4OkGNeCzwEVKxz4Pj0L67LiEMdmkbz2Mg==
X-Received: by 2002:a05:6214:1bc8:b0:6f2:b7d4:afb9 with SMTP id
 6a1803df08f44-6f896e2ee1bmr30069056d6.2.1747194847133; 
 Tue, 13 May 2025 20:54:07 -0700 (PDT)
Received: from [192.168.122.1] ([69.164.134.123])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f6e39e0347sm76029006d6.1.2025.05.13.20.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 20:54:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: hpet: rename hpet module to "device"
Date: Wed, 14 May 2025 05:54:05 +0200
Message-ID: <20250514035405.295861-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LNLPCaRM-A0AWr2xj-uuKK5w3O6yI79o9sfod9BdjX0_1747194847
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.549,
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
X-List-Received-Date: Wed, 14 May 2025 03:54:13 -0000

Follow a similar convention as pl011.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/{hpet.rs => device.rs} | 0
 rust/hw/timer/hpet/src/lib.rs                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename rust/hw/timer/hpet/src/{hpet.rs => device.rs} (100%)

diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/device.rs
similarity index 100%
rename from rust/hw/timer/hpet/src/hpet.rs
rename to rust/hw/timer/hpet/src/device.rs
diff --git a/rust/hw/timer/hpet/src/lib.rs b/rust/hw/timer/hpet/src/lib.rs
index 1954584a87e..d4b6e015506 100644
--- a/rust/hw/timer/hpet/src/lib.rs
+++ b/rust/hw/timer/hpet/src/lib.rs
@@ -8,6 +8,6 @@
 //! Precision Event Timers) device in QEMU.
 
 pub mod fw_cfg;
-pub mod hpet;
+pub mod device;
 
 pub const TYPE_HPET: &::std::ffi::CStr = c"hpet";
-- 
2.49.0


