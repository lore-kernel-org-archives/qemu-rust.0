Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKuia-0002hP-Oz
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiZ-0002fq-4g
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiX-0004gL-GY
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RS6NkNuicN22cppwE3868JJ1vrcCIE30ciMJOFo5c6w=;
 b=YGQOCQ2EDFWHvEgswZdMOiRLSlDZAdixzd/rMLaLD5hzVeZ7WxK++NH8/KZwRmFlJruwJ8
 xiSjyxJacHTxcePqRUxmQRalaUdjfKtCS91Qwi4Sv7LC+bECYIkgWV6PYk7o/NDh28WnBM
 3pBNX4hPy8zjzosFnHA1OU+xOdW9tjk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-WmZzQbNJOnK6KA750MLQow-1; Fri, 30 May 2025 04:03:51 -0400
X-MC-Unique: WmZzQbNJOnK6KA750MLQow-1
X-Mimecast-MFC-AGG-ID: WmZzQbNJOnK6KA750MLQow_1748592230
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ad8a2dc92ddso127344566b.1
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592230; x=1749197030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RS6NkNuicN22cppwE3868JJ1vrcCIE30ciMJOFo5c6w=;
 b=bTqvK4tOjaePJQTvQJqYSW0UxkFOXBugeKEG14MlOTI6kJr1y/2ISM4QTlGjwY6Oi2
 fhyR02BAdCqXWsaaZ9JtrwqKBVv2iGpMLDqaUQpJ5v4RSozcicgdhTj1C/+9VLBT6x+u
 Xo+g8r2wPIV/BhqyGTyM/Bux/volrmLh8qGEiyrIbRx6vj1dLhuf2Q7q6RHq+9Iyg1yr
 f17z/jsjbAJCGMaXaYCPPuBALNOgqDX3Xgk5MPncrCsxM0NQYD1HwzIW83qKh/xLWEC2
 EXHzWOqYCEyyevbhQZv54JowgVeOgSihCMjb3wyLJNbpptxI8r4qqnQiT6A+76cCqlJ1
 fa+g==
X-Gm-Message-State: AOJu0Yy+vw+3QL7kmZR0bzEGiYasF4CFuZzKKRuyGXF3ocu3PvGPc7HK
 5sbNzXocysgDCtLI1Bmfzx+CE8ppA/b0uBLKhMfRY686VOgqRwNVse0dd5BCHPt5Q2TBSj9ofYz
 0ioTPtEyL2VBi93/9QfT7nKnU2gylU209xwVusnavIuXJ1tp0O1Xo9vJmIY9VTAM=
X-Gm-Gg: ASbGnctpA01GGEtLnO2vwVpnUUbrllDwGJSwXWNOiVXH/+F+AQhkLPHKYw1QgnDAz4a
 RYsiJPni+jWOpTtBwfgiogPfRjgnUDDw2PJnMcU7icTTpIFv068wBdmd7RtJJ71x5s476U2Zo05
 DY1Mx3n5VqIibjb5LS7Qj267iaDhWaIlBTYCQufOxCCuwxWn4UgMDgjoC2NfhD+8J0Zuj4Ngd/T
 GXPyA5FV5AKAXof7386Cd8O5lcGp1sjj5eWCXLp4zcTJ97hMWNRPj2ucRYDrEQccfwHbzHRMFw1
 D7Z8rppARx2cFA==
X-Received: by 2002:a17:906:6a09:b0:ad5:5447:6ec2 with SMTP id
 a640c23a62f3a-adb3244b7bbmr198161166b.53.1748592229652; 
 Fri, 30 May 2025 01:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwqSK4c3tIVbuKW62gwkNC+WXhrSR8UgOdFlud+sIB0t13w65s6AuDSEAId9pOhOhzIEc+3A==
X-Received: by 2002:a17:906:6a09:b0:ad5:5447:6ec2 with SMTP id
 a640c23a62f3a-adb3244b7bbmr198158766b.53.1748592229279; 
 Fri, 30 May 2025 01:03:49 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7fecf6sm279883666b.30.2025.05.30.01.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 14/14] docs: update Rust module status
Date: Fri, 30 May 2025 10:03:06 +0200
Message-ID: <20250530080307.2055502-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T7cxaHAFcJGboJPdQaI9CcE-Z9niv865EA90-tDHdog_1748592230
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.902,
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
X-List-Received-Date: Fri, 30 May 2025 08:03:55 -0000

error is new; offset_of is gone.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 34d9c7945b7..29ae59395e8 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -155,10 +155,10 @@ module           status
 ``callbacks``    complete
 ``cell``         stable
 ``errno``        complete
+``error``        stable
 ``irq``          complete
 ``memory``       stable
 ``module``       complete
-``offset_of``    stable
 ``qdev``         stable
 ``qom``          stable
 ``sysbus``       stable
-- 
2.49.0


