Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgLQO-0007oi-74
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 05:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPy-0007SN-O4
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:17:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPw-0004IJ-V9
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738923420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfV5omvEttMhI3EQX/PeOloTPWUmqnbr5osfkTzsZPA=;
 b=Ki16fJan0qRcieWNAHk32Tbh/3cG54Cg+wzc1wQnm3frjwT8hXY4oJHsh/SQa0YET+1qfn
 /QnbJ+UlZSH7SBrmSjSASO7OHcasSYCvv8dWmlRz+3U37hRioCDk2d1TOZQGvTbV+oNtX8
 DeYgnEuMHPnnE8DSvW2hYVZv0pjLvJI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-lOyOgQRUPwenqOr6hwFA0A-1; Fri, 07 Feb 2025 05:16:59 -0500
X-MC-Unique: lOyOgQRUPwenqOr6hwFA0A-1
X-Mimecast-MFC-AGG-ID: lOyOgQRUPwenqOr6hwFA0A
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ab6eecc3221so242611266b.0
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 02:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738923418; x=1739528218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfV5omvEttMhI3EQX/PeOloTPWUmqnbr5osfkTzsZPA=;
 b=kV1kEz4jmUa3qU2QDdgOOXHRy5mu5eD5WAcnfPucP1SIqvd2c3sdzp4HPMHhf/Vb+x
 OULE68Jfx3NcprlJgeMRYwjGYtYRGFXXteQDxaW1dW3bxApvWr7wL4bZpaxz59ngDwFo
 1dYyzBRkBMqYni5Kg76cghKnB5ULnGpEu9C5Wu58y44YcCzKh0jke8imqFCP91K4ljg8
 XT0Qa6rvM+nbps8OhjQSmF5Tc/SLQBwgXfgNMutcINWU++A1z8soAP+nv/s2ier65spw
 xn3amHQiyP8QHZwyJ24wnGP0p7JoOqqqb2vCn6vcaHw2BB/e/v1t98cRHIOJrL7EOVXB
 M9iw==
X-Gm-Message-State: AOJu0YxtBrX5Kz1b2a8OgmysR63dRDBeNALsnR4abosMmXvxBDjBfH+m
 W/gHmil0l583YPnC5BtAexdui1OrFpCZJGDcLbxKJkp5Ov9ZVdaVvNSJ794jzV+vzESV3Am/HEW
 /DzqMQLIpe7N8+514QWSq7yp9KyuryQvfV+NmHs9ClsP2v/EOHN4=
X-Gm-Gg: ASbGnctjQerAiXAubEK9VXXZDyR7iWpvzdwNeJduJonEE2euPIgzMY5cDL5K7LZu/Se
 1F9zG+KfhBzXiSs4VvxuNB7LUXAibYJQte91NnECSMFhXG7wOV+GUoMWZKZLkgWcFXrExUQ3ur1
 2rSshEedxOZWakBGDPrL3Bq6vO0IKh4HMxJb36IVtzZmysUVXWzrd8sggpNmqS1YawETlv22+rk
 YFEcU7qWsfvFKhOi8Y+bkwvreZCKgvDWyED97MPB2S9aingZ2bwXxLy4cwv16fgJGzTWKWgz7By
 aJXI5w==
X-Received: by 2002:a17:907:6eac:b0:ab2:d721:ed92 with SMTP id
 a640c23a62f3a-ab789bfc571mr233636466b.45.1738923418068; 
 Fri, 07 Feb 2025 02:16:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENxl2fGDbpXRhUB0cRg1D0aYQkWxbK9bKR2Fu7DI9m+bd5p0vWIL9kMuJAABQEtkcAZ6lzbw==
X-Received: by 2002:a17:907:6eac:b0:ab2:d721:ed92 with SMTP id
 a640c23a62f3a-ab789bfc571mr233632566b.45.1738923417520; 
 Fri, 07 Feb 2025 02:16:57 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f83e30sm240714566b.38.2025.02.07.02.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:16:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 06/12] rust: qdev: make ObjectImpl a supertrait of DeviceImpl
Date: Fri,  7 Feb 2025 11:16:17 +0100
Message-ID: <20250207101623.2443552-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207101623.2443552-1-pbonzini@redhat.com>
References: <20250207101623.2443552-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Jfk06RT6XlcubiqcS5JpmitAwDdbjUf4ljeQS78n90_1738923418
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Fri, 07 Feb 2025 10:17:03 -0000

In practice it has to be implemented always in order to access an
implementation of ClassInitImpl<ObjectClass>.  Make the relationship
explicit in the code.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qdev.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 8f6744c5e26..cb6f12e726c 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -17,12 +17,12 @@
     callbacks::FnCall,
     cell::bql_locked,
     prelude::*,
-    qom::{ClassInitImpl, ObjectClass, Owned},
+    qom::{ClassInitImpl, ObjectClass, ObjectImpl, Owned},
     vmstate::VMStateDescription,
 };
 
 /// Trait providing the contents of [`DeviceClass`].
-pub trait DeviceImpl {
+pub trait DeviceImpl: ObjectImpl {
     /// _Realization_ is the second stage of device creation. It contains
     /// all operations that depend on device properties and can fail (note:
     /// this is not yet supported for Rust devices).
-- 
2.48.1


