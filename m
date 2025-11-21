Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C33BCFA765
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Nov 2025 10:03:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vMNz2-0004YO-8X; Fri, 21 Nov 2025 05:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vMNyx-0004XF-TS
 for qemu-rust@nongnu.org; Fri, 21 Nov 2025 05:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vMNyn-0007qe-Av
 for qemu-rust@nongnu.org; Fri, 21 Nov 2025 05:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763719362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWbf9BxMySjmKWS0gWktivL2wpZp7NPQlvDq4R6tsZ4=;
 b=BbBZpNiJMBaQvsem9KGfCnoR1OYc1/lyJluw1HiFK9B91rkatad6FQSD5ZiQyw1FF5awsy
 m673rdXmhqiVAhiH7zq4MxmOtx+q725cVDkQP2rgOL2WD+Dmo7+FkULpvjDyf4u2JpLnZV
 TmZ+D/RUedoMt+UkusMZXgpvCAsP7OQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-XTOhv3DqP0Wif0EHcdpQLw-1; Fri, 21 Nov 2025 05:02:40 -0500
X-MC-Unique: XTOhv3DqP0Wif0EHcdpQLw-1
X-Mimecast-MFC-AGG-ID: XTOhv3DqP0Wif0EHcdpQLw_1763719360
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477a0ddd1d4so21880045e9.0
 for <qemu-rust@nongnu.org>; Fri, 21 Nov 2025 02:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763719360; x=1764324160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AWbf9BxMySjmKWS0gWktivL2wpZp7NPQlvDq4R6tsZ4=;
 b=eDc6gCJ4okKzL0E5LSDyo6Ydq3OEHzEeuKB0FIGjbc/BBlYWN2zJRGE329+ySLTchi
 5alauvzBnZrLKyDhFuZ78J3Xti7zDSIB3IoD2PxeTZqsR9VvpvPzfpKBaot6ciY+y3gs
 n3Wzlg8+fW+sNhngvXrGKD/zAp38TKI3kf03iuTN/WoA34392wEABopSeF10gtlLnF2B
 NIFLQFrEV778tkbfPq/zT/3npBdTEb1aeJLENHTajOyeMFtL7pEzseDGu/I7uKA+PpWA
 pfWLDhmstqto4zwvpbMeSHcSB3H7RgEEhFulYouYgHW1Yz0A8d0F60GSeNF9Y3i4q48f
 mUdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGBoPwZ1j/gSHnuOKplFgZopTbISHnuEKp/TBOhLC58faI+f4l0ujulIKNE3TlLzthsDz/ZVk5hGg=@nongnu.org
X-Gm-Message-State: AOJu0Yz0vHCnKaqK1s5/EOKepJI3L3uSiKN5PMUBSVRj4braEFOXiKrN
 6XneCamF4UAHgsABMaW3eA/0hBr0v9z+apHKUj1n+/jWfoQ/+t7PgWElbY6W6eJWe8aGFUWyg4u
 Usl8abE+GdvreZsSBWmBgVNjlM3xVqDeZv4FSL1nbkkEzAmgKtL6Qzao=
X-Gm-Gg: ASbGncuFK7vBfAc/eiT453sFKZRecIQ3L75fbCwmhepSPiRxdvIz4J/tHV2S87QdSvR
 80SPnZkLy8LcP5uBtSblHQWSi3zFaOjm9fonuoFHDAgRwOSlyx2cvo8Ccb4nh0nEToB326+8Hk8
 KytKnzMpal05hm0oaAdz6XxWmWpYYgMI5WLwncJOX/o5G7kFcaIWCbz2bjGeAHqyi1Q7HaUdPU6
 l2GdJm4n38t7D04bTyzS45+Imz2L1znHPSGGNW+UlElSmS6KTnGOLmize8mVDA4u/zGPiAZ7u28
 ZUX866XUq2iK6R4FgjkOwyHPIrDtxG1PJqyx0WWH3mR88/3aJ47YD8RKv/gTnipJtNWkpyezeK9
 0iUioB02b8NHPo5iTy4I/qwdYJiv+eei+/koF/zafTr09SPn6DZ9/Jz0qJhL7+b/5UPEZjJp5fW
 ix/MZtwuTrezaGa7U=
X-Received: by 2002:a05:600c:6296:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-477c10d7013mr16283455e9.11.1763719359393; 
 Fri, 21 Nov 2025 02:02:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXk43274RwMsJ/7Oqom2j5zOONjQYKaP058GIvdAhktRkxM2A42YCKBZVO9LPhuGvBDt/X8A==
X-Received: by 2002:a05:600c:6296:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-477c10d7013mr16283075e9.11.1763719358975; 
 Fri, 21 Nov 2025 02:02:38 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf355933sm36925915e9.2.2025.11.21.02.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 02:02:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-rust@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Thomas Huth <thuth@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Josh Stone <jistone@redhat.com>
Subject: Re: [PATCH v2 0/4] trace: add Rust DTrace/SystemTap SDT support
Date: Fri, 21 Nov 2025 11:02:20 +0100
Message-ID: <20251121100219.654238-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119205200.173170-1-stefanha@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jsmxDeDxl5xY_27KEeTK4goOotnTjXj2CvUDwMoLcaY_1763719360
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> v2:
> - Re-export probe::probe!() from the trace crate to avoid the explicit probe
>   crate dependency from hpet, pl011, etc. [Paolo]

Queued to rust-next, thanks.

Paolo


