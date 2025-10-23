Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA48CCD1BE
	for <qemu-rust@archiver.kernel.org>; Thu, 23 Oct 2025 13:54:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vBvmL-0002mB-5V; Thu, 23 Oct 2025 09:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1vBvmG-0002Yy-IY
 for qemu-rust@nongnu.org; Thu, 23 Oct 2025 09:54:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1vBvmE-0004vU-At
 for qemu-rust@nongnu.org; Thu, 23 Oct 2025 09:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761227662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8wea7NK5QlWnIzDozQt/I5YMLo/WNbD+ENI9kZgAa7E=;
 b=Y9nhs9gFF3SaJnHA+phb0Z9M801RaZcVeGrpo/8EX0bEdMWnP6NjOZFjFe8T02pJ9vqWQz
 PcMjrN49syjNdfgS13Bt/kfhXcNGnWWir/aq68XX3hTItim/9RG1TfcgHCKaoGwKqK9cS3
 fqhzSP/kA5NbwmVSc3wahnYxdTf0RzU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-A1PNkTMiMyeI7uJ5nsXc_w-1; Thu, 23 Oct 2025 09:54:21 -0400
X-MC-Unique: A1PNkTMiMyeI7uJ5nsXc_w-1
X-Mimecast-MFC-AGG-ID: A1PNkTMiMyeI7uJ5nsXc_w_1761227660
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47107fcb257so5909655e9.0
 for <qemu-rust@nongnu.org>; Thu, 23 Oct 2025 06:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761227660; x=1761832460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8wea7NK5QlWnIzDozQt/I5YMLo/WNbD+ENI9kZgAa7E=;
 b=oLRpZiOtuuJM7i1NXfHae0unqxa8OZX73h5q8i/hnrWm7h4+a/CRa4NeXmfNlGFxCc
 1ThLVrWttvsPtLfz6S2dS1IvCJaffFDyZdsZROOKp2tFG4+TjEPoSIgBo0//JTxNAl8t
 gw9HE/91RkPB61aNdSVS0UAqyBXf3TqBawu69g2Q0pNz0FcySYQTCShG5grOQQRmz4+O
 3z+uaMvdWxVIIIKOGH57Urax2xOhI/EKHPPSCq0cNy9HIhRzHnvrJoaa7zquYZ6lwYtl
 cYUtgwQfKtlAOYAggVWpmWPQJ0Uxz8kQAQS9j24jPhtOfO0Xp1QBTytOINW9Y57E9Htj
 KEIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxtmSjjrJtXEd+RncVES8aGKaa30aUFjdi9SNGFywBmfrLAGBBUUFFa/BMFD2J6+gf22ekSU5dQz8=@nongnu.org
X-Gm-Message-State: AOJu0YyEIbzO4I92KA95zw0w/AQokV1vu7mfnIUExIVZp8Te/IpmLPP+
 riTN8sJU88u1K/UeJr1E92xdP5rLcxKiXJqCcLRUtLLKkm5FImB/Ib+ZRAtxJe7dfkfTXv8CmhK
 r5RHfBrHdtboYf1DX0NXuBGCD8KanjFzU3q7wbMIyLZ7cct/y2dqqLkA=
X-Gm-Gg: ASbGncuE6lx3vG2zJrvQ1/IIWjtU1Ntylp/7K63xxGdt7tu80tEb+aTLgBAYFY3mROk
 Vt+Lc6Vya4FjMhbdv2sz5y/SgeFfF2L9PzlCViJV2s7QJ6+aaBjxBHW0lJwqPNPc7wOe8tSvMb0
 B/ONAngKjNTJeQX2CZglJmdPbQlOuctZmmJ3QdlVvRnRLK4eFfj77yawg79V/ZDt72Mol+xxFDG
 aUg90qhJ0K5+nm3JKLc9jxWwTCzj1HsXufGNRI2YBEHKgZBghJA2SiJzpuuTJ6l8cejGHx1wneZ
 jIyRUmGvlZzm1jQkUrxPNwcpKAmSEKCSzR2p4IUDJQKXQfMQDXskxVJ7MR2JZt4mrHMyuOP+Ut4
 zOLe8TXXW
X-Received: by 2002:a05:600c:470d:b0:471:12c2:2025 with SMTP id
 5b1f17b1804b1-471179140abmr211589025e9.32.1761227659841; 
 Thu, 23 Oct 2025 06:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwULW8h0Re8+kXSlcx2urbXcMc8wv1br0odV4oLSeuM1EMpO81fWvMOBhF/bVr62Y/qdGKlQ==
X-Received: by 2002:a05:600c:470d:b0:471:12c2:2025 with SMTP id
 5b1f17b1804b1-471179140abmr211588845e9.32.1761227659418; 
 Thu, 23 Oct 2025 06:54:19 -0700 (PDT)
Received: from wheatley.localdomain ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4378cbesm95123025e9.16.2025.10.23.06.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 06:54:18 -0700 (PDT)
Received: from wheatley.pinto-pinecone.ts.net (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 5EB16DC7C866;
 Thu, 23 Oct 2025 15:54:18 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: 'Manos Pitsidianakis ' <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] rust: Make common::Wrapper work with non-tuple structs
Date: Thu, 23 Oct 2025 15:54:07 +0200
Message-ID: <cover.1761226974.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3f45pUkfV8GbFUFzUih7njLZBUE5lkkUPCFfHITO0oY_1761227660
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

As part of my "investigation" [0] into safer object initialization using
pinned-init, I found out that pinned-init will probably not work with tuple
structs for some time [1].  So I figured out how to change QEMU's Wrapper derive
macro so that both tuple structs and classic structs (still `#[repr(transparent)]`
and having only one member) are supported.

The second patch is there just to show that it works, I also checked the result
with `cargo expand` to make sure.

This is just to see if the patch makes sense the way it is.  I'm still trying to
see the best way forward with this pinning effort.  Many thanks for Paolo's
patience with me.  I'm using what I learn to also try and make a proof of
concept of something similar to the RustInQEMU effort (although way smaller in
scope) in libvirt, so it takes a bit more time.

[0] read: learning QEMU internals and possible Rust usage
[1] https://github.com/Rust-for-Linux/pin-init/issues/85

Martin Kletzander (2):
  rust: Make common::Wrapper work with non-tuple structs as well
  rust/util: Change Timer and TimerListGroup to normal structs

 rust/qemu-macros/src/lib.rs | 49 ++++++++++++++++++++++++++++---------
 rust/util/src/timer.rs      | 10 +++++---
 2 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.51.0


