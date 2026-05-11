Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE11CD37BE
	for <qemu-rust@archiver.kernel.org>; Mon, 11 May 2026 20:01:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wMWoQ-0005Gk-OS; Mon, 11 May 2026 16:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wMVj9-0007u8-4g
 for qemu-rust@nongnu.org; Mon, 11 May 2026 14:51:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wMVj6-0002sy-Bw
 for qemu-rust@nongnu.org; Mon, 11 May 2026 14:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778525493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZE0aHY8LTHR3vaNLyCsOVAN7ZopvEVlo3E8AOJCnxw=;
 b=Qziwxud0a+N+xkIOBlDlp7OJz6uRoJxnGk9SibkoV7X3gs0I8DDmpql+9Q5XOPXZ9Wj+yJ
 SM6QFo0zyTzu6bzPQHc/3zrp/74vmj7NUHBfRiALlY4CAoS4CAhRGQB+dnBVIKvDY3d+zp
 UAXllvPSt8D4QaUXUI+PsA3qoS/D+5E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-mBqMFXcaNYekUjTXJcNx_g-1; Mon, 11 May 2026 14:51:32 -0400
X-MC-Unique: mBqMFXcaNYekUjTXJcNx_g-1
X-Mimecast-MFC-AGG-ID: mBqMFXcaNYekUjTXJcNx_g_1778525492
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-514a182b90dso26313181cf.1
 for <qemu-rust@nongnu.org>; Mon, 11 May 2026 11:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778525492; x=1779130292;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BZE0aHY8LTHR3vaNLyCsOVAN7ZopvEVlo3E8AOJCnxw=;
 b=ilQBSLBjCFPlqpLNVA3vPlnFSJ4rV3aORso3M50d3TO5KzpyTiYHjQpqv4/KqI5kOu
 g+rC0DACS1R0+aP6gHzKoUoewUfGWHBhMgJgcIascA9/z80ElN2qANtSqJk1B/yPtlAb
 OlnRQfuv7KEZqjcdeW3Rw/lPKiCd/b3//p7ExhmkxkpKv/tziJSLjjfbUEYGaJDukLzU
 AQs7KnzETb6Xqdpei424G+kHzwwIwe5RboMFi49bG24ep6uPxU3+exRU5C/WfSKUkAX2
 GpnWMZiRfC4ihPdL/UEQrln+2VWVvigokgNY36pJiiOR19BaRikiKOr3TXCqBNU6Tu2k
 3F5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ98LMnAN8lmpY5NwLOv+k3+X3YWRW1hJFJ6XqzFB3HEWAe3SGNWvYW4DfGG/ZYxkoXHMH77enwk7sA=@nongnu.org
X-Gm-Message-State: AOJu0YxsiNwfy7xs5+bkc47Q1WVdfEq4xNKdBxAXbAjRp6Vgk0VZk//H
 CV6Hm9WNYtNwf+cTkseph8iH34xpjthg+ebOxV0zXn45yk1xgCCRKIU+AgwS5W8aWYTO1n1DYPY
 /yyQmdb37pD82BAgXcL3PAs03lzxvuXxPYWhXCmVoKIkbMt/qx97ZB68=
X-Gm-Gg: Acq92OHbXc9SqRGbGjkra9Puv/e6wVfMQh55X3VjMyy4BSZODPN4qBHQB6QH8AFF62J
 ddxjhjtyOp1pdpuGueuv7MvHvqt4iGVBAXd7Ld3pVzv9nd3c8AO/Z8ugNvijbWAmzzbZosJoOdQ
 E2AY+O7KUCxtnJeAs0qFyvt6ZM9ihAut5S5Zm5cOy6QyX86XD+vzUnMm3sUQ519tthjtogXJsDJ
 3QRU02CvFlq05mXj7pTpjLPFTuCWfvD8nRNmVAW0TFuMr3zZyBwimRfxvn2Jml/tPYuSaVNt2nu
 Y1n9+YOV+cKXyPsA+MoVTovHsf3A9xoCf1oAaSd4FZGBjCYCklxzoQzDIpkALiCszYPwbegJ29V
 z9eKKSOAu/wgLp+J7vTfDwCn3QbvACchhvjttO4g42C2SiAk=
X-Received: by 2002:a05:622a:6096:b0:50d:6baa:9e9c with SMTP id
 d75a77b69052e-51461bea15amr340975781cf.6.1778525491750; 
 Mon, 11 May 2026 11:51:31 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:50d:6baa:9e9c with SMTP id
 d75a77b69052e-51461bea15amr340975321cf.6.1778525491136; 
 Mon, 11 May 2026 11:51:31 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5148e7bef56sm97611941cf.15.2026.05.11.11.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 11:51:30 -0700 (PDT)
Date: Mon, 11 May 2026 14:51:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-rust@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] migration: Remove VMS_MULTIPLY_ELEMENTS and
 VMSTATE_VARRAY_MULTIPLY()
Message-ID: <agIlMU-kwGyyfJla@x1.local>
References: <20260507070228.48877-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20260507070228.48877-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lVlbwUU7g4_HRZxD_RJ5QkPjXTMmmtXaXF2BUXtrjpk_1778525492
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 May 2026 16:01:09 -0400
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

On Thu, May 07, 2026 at 09:02:28AM +0200, Philippe Mathieu-Daudé wrote:
> Commit c1eb3ac3468 ("target/sparc: Replace
> VMSTATE_VARRAY_MULTIPLY -> VMSTATE_UINTTL_ARRAY") removed the
> last use of the VMSTATE_VARRAY_MULTIPLY() macro. We can now
> remove it as unnecessary, along with the VMS_MULTIPLY_ELEMENTS
> flag and the associated tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

queued, thanks.

-- 
Peter Xu


