Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505EBC83F1B
	for <qemu-rust@archiver.kernel.org>; Fri, 11 Jul 2025 17:11:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uaHGn-0005t6-9M; Fri, 11 Jul 2025 13:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uaHGW-0005rP-FY
 for qemu-rust@nongnu.org; Fri, 11 Jul 2025 13:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uaHGU-0000Jl-Rd
 for qemu-rust@nongnu.org; Fri, 11 Jul 2025 13:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752253824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BQ23q8rO/4JwlQZO7v+InvClXfpIIGFsmYUMuDuGeI=;
 b=bN/8UAavYbVI6PV4/1XgGqMYP4+a+lhPf6rqtj7ssEK7WzgR97pUNJMifZcJorBcOsQYQ6
 g1MrOAfoU5P82xSF6e7qMqQIiee6s3c5MK6oxoeLu1f+YKOQa494/OFq7J1h81BEhOWv5/
 7tJNtcB/FCQtiSpQfP9oi2bjJZuo4mw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-IvGa4P2KNbenewcR_KfpMg-1; Fri, 11 Jul 2025 13:10:23 -0400
X-MC-Unique: IvGa4P2KNbenewcR_KfpMg-1
X-Mimecast-MFC-AGG-ID: IvGa4P2KNbenewcR_KfpMg_1752253822
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-454acc74f22so14996045e9.2
 for <qemu-rust@nongnu.org>; Fri, 11 Jul 2025 10:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752253822; x=1752858622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BQ23q8rO/4JwlQZO7v+InvClXfpIIGFsmYUMuDuGeI=;
 b=NfeWDvzfda2WyjuMQwAYQPhGfbWiMVT3ul/vDs1NTz5/0inPT9CSa2ycjPkUQC9/64
 0M5wcFHNI1ifrHzTiK5aGKzW6jJLBVePE91T54uvfpxNdGi3SG4UneKsxnzR4Xq2CsDp
 JlBYC8ndFOB0Dh4yuvB+ish/6F5gYzJZSUKuBYkbb4ImrzAx/fB0xdboTaVsT3fnIWHO
 d3pnh3ZFdjehs5uPtmq0cjgA81D285PKaEJ6j3lmLyfte2fl1pf9olP8wS0ePpmafIla
 KRgf1LjOdkiuLdn8vtSULo77OvxCQa5FZGAfYYfHSro4zJlln8PpKPwlNkWeoBxN61/H
 guVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa20tQgxyr2T1iC6Ji5lmikY3q7ATIEVIDtV15P2xFi/tRShyG1PshdyRlN9gMJHwbbfU81PpC0nM=@nongnu.org
X-Gm-Message-State: AOJu0Yy5ryl0spT1jJOBdVD+L16POODtN/bzQUVQ39dfRaMm/xzwR0av
 ckkjIfQBi6xTKvS/+E1kVt/QOdOpbszcQC43wykppXKBsu3AogdADtZe//ZMWpi8jhQhqIYFnsF
 czdRGLPIi/N8uIrI6QXDtv1fpUHeFrk90e7ipHuIE3M6aR58PXF0bueA=
X-Gm-Gg: ASbGncuKhcONprRpFMBbjDV36kNkOaD1aEaTQbBr9pgzvmLcDSgLCfVUBz3PpCpsBn1
 bLuxUtBdUwudHBGaolXcDW0BE/bdUWpedXLa+esSkIo8IaKhrG7BRiF9Phwx+659MEi7Vr/65P9
 Mre0R55liJXchOe7sKmS+S9COr4mQ0igU6S2eOJnrb/mMXJ7eiRcnlJX5S0z6Wf7eIgimQJNv/J
 eX/65US0xEcLH8Av4boh1A+slqBFJt06RGtla/382iAa4xSb7F4sWpH0yePhBEr8c2L5lylgS5E
 jbM+t31YEAYVQXp7q7UJhCzKNm4u9cRV7xoBACH2xDDU
X-Received: by 2002:a05:600c:4e8c:b0:453:606b:daea with SMTP id
 5b1f17b1804b1-45565ed6221mr29690105e9.20.1752253822060; 
 Fri, 11 Jul 2025 10:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvZHqUmb4lfYVRykyJM2NP3n8/BzdQr832ZsSR905aWn6hDITOmsFaYjRTuxQdWrPnIVKbyg==
X-Received: by 2002:a05:600c:4e8c:b0:453:606b:daea with SMTP id
 5b1f17b1804b1-45565ed6221mr29689815e9.20.1752253821580; 
 Fri, 11 Jul 2025 10:10:21 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.202.169])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc9349sm4905153f8f.45.2025.07.11.10.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 10:10:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v3] rust: add qdev Device derive macro
Date: Fri, 11 Jul 2025 19:08:01 +0200
Message-ID: <20250711170800.503561-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711-rust-qdev-properties-v3-1-e198624416fb@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GZA2aFEa__3YZD4LZuh6IMTqR56lfX52TBGq6SFkz3E_1752253822
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

> Add derive macro for declaring qdev properties directly above the field
> definitions. To do this, we split DeviceImpl::properties method on a
> separate trait so we can implement only that part in the derive macro
> expansion (we cannot partially implement the DeviceImpl trait).
>
> Adding a `property` attribute above the field declaration will generate
> a `qemu_api::bindings::Property` array member in the device's property
> list.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Applied to branch rust-next of https://gitlab.com/bonzini/qemu, thanks!

> This patch depends on patches that haven't been merged yet to master

And especially on bumping the minimum supported Rust version to 1.83,
like the pending vmstate work which is sitting in the branch.  I fixed
the conflicts and rebased it on top of this patch.

Paolo


