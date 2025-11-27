Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE34D11183
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObwH-0007a7-IS; Thu, 27 Nov 2025 08:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvd-0005Yc-De
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvb-00026u-SX
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Pepi6jeH9DfFFMv3XK3Bu8X8CyejOzTLvd3kGqRwko=;
 b=B8F8VRQDVTiq8sFmGOjOxl8FQIJmnkKAoVgsKpW4APkxc2BRtjfalVLyOnAdII1IX19/6Q
 pl5QM/PWIvzOwbUKok12uL6uno2V2bZl91XE1w8IOL3SVNwX2zDxOrZRzY9lG78gl1xcpx
 10PLWgoxnAjeFyET1z8mB1BebqglOVA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-LgphhWRMNJKxSM9fgeQh-Q-1; Thu, 27 Nov 2025 08:20:54 -0500
X-MC-Unique: LgphhWRMNJKxSM9fgeQh-Q-1
X-Mimecast-MFC-AGG-ID: LgphhWRMNJKxSM9fgeQh-Q_1764249653
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b70b2a89c22so204722066b.0
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249652; x=1764854452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/Pepi6jeH9DfFFMv3XK3Bu8X8CyejOzTLvd3kGqRwko=;
 b=Pe1kKogtsff2DDt3KZjMvTGFhjUc7D9iS4+YP1LkT3w1L8CUfCncUhJHyXnI++hyeB
 pCjOx7EPJ5EbqMdKUyN447dY+jqCN74J3Ox0QuPyorCMc//lNmAtP+6wKgWemlmN1Drt
 cbbn6hq6crkALk3kslSOVhTECnuyrIeQfpor8+8HlpGCLoSMtfA3gr3vsridzhHyMaS7
 CUKzLWPDhkzXRgWSS1WndWZlKdO14c4KA2HQ//yyob7CpTRmI00o7VNFXdxrFGK7sxnA
 CcvUGWkL000sbmX5S7YeoVs3DutJA4g3yZ4VrerzZUpfn8n3hwMvs0564e+RCjc3/Y4L
 8mkw==
X-Gm-Message-State: AOJu0YxGXFlQ4hQn5mbiXmjWFrsxuLfToClPqFzi001z516ihAu0SeMs
 0k4yOGTbEO5v1gyX0aaJWd/xNX7sGMYku4uzJzufTojkdLb+4BE24A95+JOVw65uJez1UGLXz78
 /1MKG5ohQLI4kqgE8A6dIYzSlH0g6nWe7iSQKy6CfanS8qOcHDLrlZecsCeGPs/A=
X-Gm-Gg: ASbGnct/cd61YJ5H3vHZKwjJAzRg/LUBGAMdH8Vs4Gg+KpMTQflHEXGFWND1BukKUB0
 G2ysgy1qXRqWt/+mpzi+k3ncwsEHpgJViVRMcwhA2XjzTcwcCFW6NdcZQdcKGaU7RzKhSdiBJqP
 yFJLke9USu3btOyP6Byj4IhQPYZpAvwUwEPnuY4YxNqfaS7k3McRd36jSIRI7RZALhEoaHBuWBd
 O5ol+9HaHNZrlSJJf5qpD9Ni3+D8QIQQmaB6Lnbyjq9TBdvr5qBfJ948BkQjE/xpiZusWrq/dVK
 /aDKv152mY6/JlIGHeZfSstHy4T8gDP4z7iFPyjOIPhH/oQrZohkGjNXHbSJU1zNnFaqqy0sFxS
 IuyM/KIk/emAF+j5xkeKJqOtYwC52aS8B4lAj+DdLUWHTCzmrCdoQwQmVU/5t/LTjzXJTeMCUn4
 5xsj5RIOIwgUikMio=
X-Received: by 2002:a17:907:7f02:b0:b76:25fd:70e5 with SMTP id
 a640c23a62f3a-b7657172f39mr2965548666b.9.1764249652408; 
 Thu, 27 Nov 2025 05:20:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrG1KsgGUtAnUytaISRdYHjVYWool3bGVjcqpuHMouu1tGFNLcWGETNobColG90nPIVwj/dw==
X-Received: by 2002:a17:907:7f02:b0:b76:25fd:70e5 with SMTP id
 a640c23a62f3a-b7657172f39mr2965545266b.9.1764249652018; 
 Thu, 27 Nov 2025 05:20:52 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f519e2f0sm163084466b.21.2025.11.27.05.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 6/9] rust: fix reference to MemoryRegion
Date: Thu, 27 Nov 2025 14:20:33 +0100
Message-ID: <20251127132036.84384-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127132036.84384-1-pbonzini@redhat.com>
References: <20251127132036.84384-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: igoXrd_TZe-9tAZB1bbjlbIvWiz8tW1ngHF4IFDYrzM_1764249653
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
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

Use the wrapper struct, not the C one.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/bql/src/cell.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/bql/src/cell.rs b/rust/bql/src/cell.rs
index 8ade7db629c..435d6663ac4 100644
--- a/rust/bql/src/cell.rs
+++ b/rust/bql/src/cell.rs
@@ -42,7 +42,7 @@
 //! references to an object and yet mutate it. In particular, QEMU objects
 //! usually have their pointer shared with the "outside world very early in
 //! their lifetime", for example when they create their
-//! [`MemoryRegion`s](crate::bindings::MemoryRegion).  Therefore, individual
+//! [`MemoryRegion`s](system::MemoryRegion).  Therefore, individual
 //! parts of a  device must be made mutable in a controlled manner; this module
 //! provides the tools to do so.
 //!
-- 
2.51.1


