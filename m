Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E9C83F0F
	for <qemu-rust@archiver.kernel.org>; Tue,  8 Jul 2025 21:26:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uZFI5-0004Tv-4w; Tue, 08 Jul 2025 16:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZEKg-0008Vb-Pf
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 15:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZEKd-0007y6-SU
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 15:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752004222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=E8hiKe7hTF/ZWIq6LHrw6fudgFlMlxwalAMqYHVxj1/gx/HzS+nySMLGvMqILdiI0xcwYe
 K1Q4ir+VUtb+nCCI5PXOwtvpz+VBD86nHLAOjJCj8J/XigjOBB4Aunba0zNwFMNMJCt58p
 lIjXvPDKbShkDI2TFd6vWjBdP7NlNbk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-XHZ-_tu5NIySGHqOyKGLew-1; Tue, 08 Jul 2025 04:23:02 -0400
X-MC-Unique: XHZ-_tu5NIySGHqOyKGLew-1
X-Mimecast-MFC-AGG-ID: XHZ-_tu5NIySGHqOyKGLew_1751962981
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a50816cc58so1720689f8f.3
 for <qemu-rust@nongnu.org>; Tue, 08 Jul 2025 01:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751962981; x=1752567781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=cKFXWgZ0ia4dVghzvbuxxP+9quGVkSMq+XXo//lf/2zYzBQ0h+L0+7O5DBRaRX40S3
 I1Pj8Xrw9JRtAl3syWvUl7XzNBv6DmqlA8cwZ4mW9sZJSnMOrvaUJcM7AVSmq9fM09/I
 nN+NpX9wqLkwl4H1DPHvX61nixJBVdiClqbsOBydYEl2hxZhkGvZTWmZWDHvRD1s0fyc
 wPQIC/yA9JGXIIobzHUZ+whoIrNRj77umfarsE9toIWRZxyYgxyfMDwDtqtanZ/QHEsK
 p4jD4SZ9RY9zg138YbjYsIaFeLuk5rMuEDrX3VcrJoJI6dS9ZriSKKPc1wxdFZZp6/d8
 AMmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmGbwCZUa+cLrsssvHN3IRHBcBvlJCpyZJXLxOehnfMiaaBSJZkM66+VhwJ5iz2cE8VpQEGgrhFtw=@nongnu.org
X-Gm-Message-State: AOJu0Yy/9Kto3s9ejQS81jYf/mTBI+zZEkW3I2cdqlpyXBJVhgSuKjIK
 HTeJbMOhXNxI49+fRN9bgZenskLQzkbTBVNLih363sbux27SnUpu1ClDAbllrTmxTQAXTUL8LNT
 BLfBs2BFlNgmLF7676116LqZ5dTo8cMzx5C5q4cTPGgL3cYP+YeGHz1R0J+6zVpw=
X-Gm-Gg: ASbGnctpLLABk4O/u8wAcnD3F+g3ZSDRk2ABlaBCiRIJihOA5ApEc4JGoZbuc17t8eW
 ba4YqB5zj0z/yPRGBL2KRXwcS6mBuYnwK/YzUTwkh+XMFhAsbUo5rZMnRF0lH04mD7v2fmBJ4KP
 lJVSEpGFyKUKha9Ad8zUlvNgmAz+d51yeOjvO0RmVrIpD7OSMc5qNtbyPP2tbaenUZOAFFnxMRJ
 A5t5LvYoo1QAhXEnHYA9vzlPeLxRQVQgbrdXnfsWfcr8Tj91rj1hki3TRD1azxa+iXmheuAc0jt
 PmMwkszabqnVO0X/CbtmhwL0X5U=
X-Received: by 2002:a5d:6f02:0:b0:3a5:5270:a52c with SMTP id
 ffacd0b85a97d-3b5dde2c12dmr1503892f8f.0.1751962980525; 
 Tue, 08 Jul 2025 01:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoO5r5PAEwXY3US8uMGwHfMflXhkQjvmGjfATC/9KOQfbHkmPGy1gCREThPux5hLq6uYu3XQ==
X-Received: by 2002:a5d:6f02:0:b0:3a5:5270:a52c with SMTP id
 ffacd0b85a97d-3b5dde2c12dmr1503875f8f.0.1751962980115; 
 Tue, 08 Jul 2025 01:23:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.202.169])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b470e928aesm12105531f8f.44.2025.07.08.01.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 01:22:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@intel.com>
Subject: Re: [PATCH] rust/qemu-api: Fix binding path in source directory
Date: Tue,  8 Jul 2025 10:22:53 +0200
Message-ID: <20250708082253.49038-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623073436.1833357-1-zhao1.liu@intel.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rksmGnPzI8uEAxV28Opc3Bbts1uHMko8N5UUvMqiqHY_1751962981
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Queued, thanks.

Paolo


