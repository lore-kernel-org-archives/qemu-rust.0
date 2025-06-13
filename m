Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uQ43n-0000Ht-QC
	for mharc-qemu-rust@gnu.org; Fri, 13 Jun 2025 09:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uQ43f-00007F-8z
 for qemu-rust@nongnu.org; Fri, 13 Jun 2025 09:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uQ43c-0000XU-Pj
 for qemu-rust@nongnu.org; Fri, 13 Jun 2025 09:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749819774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fTmKpP8w3YOufMMHrmc/o9OxkEtqAJy0lRMA112nurQ=;
 b=LZbIpsFDJlUsqs4Nl2r8hApTM+F9ElrUVSdKKAOdAJ+CVm1GHkyNPsDoY9w+o2v/aJ2HPA
 /ep9KMvrANbvqPDC0WCHYO33Yx5hnk/nu1sExJX5OVLf0dW1qlIppFSOWemDPDiMmxyjme
 uuUnFR2c+1ZoF4dY/652wRrdkrtrywI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-SdiKYMrLNjabjCY4hvYWag-1; Fri, 13 Jun 2025 09:02:53 -0400
X-MC-Unique: SdiKYMrLNjabjCY4hvYWag-1
X-Mimecast-MFC-AGG-ID: SdiKYMrLNjabjCY4hvYWag_1749819772
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f85f31d9so970722f8f.1
 for <qemu-rust@nongnu.org>; Fri, 13 Jun 2025 06:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749819771; x=1750424571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTmKpP8w3YOufMMHrmc/o9OxkEtqAJy0lRMA112nurQ=;
 b=H5hqpC4cymKNo2mc7BB2u/T3CgYLiEbnuzAp4yLyzOGXt7kAyYXzzYrS8H2rU/cWut
 GV69oOTcKdJmNqeuy9Y8CZC4lRIVSM6lo07NQXRqzv1KXTNMOCVycBZ4cqvTNhqLdjUw
 IDU1D3SbleLUksojnTg7CEz6rJglL+7ruHu/EPEj5W9eROGTX+rzwqvCg5vfdfwC0CUW
 rBbheKMtiZnFwGziD0yjNRewREWTEXAY/IWGsXUZo9F7mTds1aShjvQatNYMZ154NrXV
 dF0nzEGw2y9SMWyiWKge4i7wh8jIO/eg8hl/2tG1viNkp2QPDzHFr8AbBSipd2pUZPDn
 Zy9w==
X-Gm-Message-State: AOJu0YxAi/UDl+4v/How++GRH0709we/j387cLzWD17yCrIRy3PTOCbO
 tTAH1UnO06SwT3j0ghdt9qrpKz5pf6zdBW9vH5WaRpgavKjR96OG8kJdTrVgNOt5APPf0RJA6Hp
 1iqGP5/pWZMDOR5qa7TPdG5zQlH/K2MX0OxZcksNmpec5+noD5+4oCls=
X-Gm-Gg: ASbGnctg3e5XZU/53eQAQhWWYbAdwzN/AEUvpVvmAIhU+d3+5GIIOgFZcLaXGbix7/2
 C2HFkx3OHLZpDxKM9M9WLFIoMtrMxefZ+Q6Ufm7CUsPeOQn6BazPp0T1iVzNheFxfBQAC9XTsk1
 B8bMSbxKjxXuLd/8nShxezsOT4xMNw5JNdz3g83CBveGLu2y7oF0Q7Elu465mGuZd6qnIwwBvYo
 n12LvytZygrITa+QE7pCFNddaUn3vj4OieobA5Fyt1BupvZsByBCe2Xg0TCB67Jb9vaIg3g8ldv
 GmH9gQjrqwrK8DIymLpDRSaU
X-Received: by 2002:a5d:588a:0:b0:3a4:dc32:6cbc with SMTP id
 ffacd0b85a97d-3a5686fc13emr3066181f8f.20.1749819771566; 
 Fri, 13 Jun 2025 06:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj8YbPaVuYUiIghyr6ULRhQJnrGhec2ndGWIDog5Jd7eKAIrfi/M/Lgg6kbgTWJtcDGn8X2A==
X-Received: by 2002:a5d:588a:0:b0:3a4:dc32:6cbc with SMTP id
 ffacd0b85a97d-3a5686fc13emr3066127f8f.20.1749819770790; 
 Fri, 13 Jun 2025 06:02:50 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a612d8sm2323170f8f.24.2025.06.13.06.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:02:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	tanishdesai37@gmail.com
Subject: [PATCH 0/2] rust: prepare for multiple bindgen invocations
Date: Fri, 13 Jun 2025 15:02:47 +0200
Message-ID: <20250613130249.1225545-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IBYNMEvznYbFSp-sfaB1qBBuUUPWMZFssXz4efROWrI_1749819772
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
X-List-Received-Date: Fri, 13 Jun 2025 13:02:59 -0000

This is a preparation for the splitting of qemu-api in multiple
crates.  While I didn't do that yet, I am doing this part early
just in case it comes in handy for the Rust implementation of
tracing.

Paolo

Paolo Bonzini (2):
  rust: prepare variable definitions for multiple bindgen invocations
  rust: move rust.bindgen to qemu-api crate

 meson.build                   | 52 +++++------------------------------
 rust/{ => qemu-api}/wrapper.h |  0
 rust/meson.build              |  4 ++-
 rust/qemu-api/meson.build     | 43 ++++++++++++++++++++++++++++-
 4 files changed, 52 insertions(+), 47 deletions(-)
 rename rust/{ => qemu-api}/wrapper.h (100%)

-- 
2.49.0


