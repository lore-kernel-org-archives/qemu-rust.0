Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiEJD-0005Yz-HH
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 10:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiEJ9-0005YA-5t
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 10:05:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiEJ7-0005Np-Kf
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 10:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739372744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xpi6XrIfU8ynTSLJgJioMjgRVH8BsjQhrh5/KYMHUFM=;
 b=hMTEoZx/iEYNe3UhBVbgNxJg9cUEbF9VZCrv2KZyn02TlZ6LLV2sStNtRAICO3VOIBXhz/
 XtI0lqhUsbzOljflAKiH2V85frPdcd3D+Jr7z2NBqpJlQ52w25WE+UGHVjwLuPzleFbN/X
 jpNs8JShxPY/xBi663eYzUBQrOIBIj4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-_NhEvLKFNQqQHSfkSOlWZA-1; Wed, 12 Feb 2025 10:05:43 -0500
X-MC-Unique: _NhEvLKFNQqQHSfkSOlWZA-1
X-Mimecast-MFC-AGG-ID: _NhEvLKFNQqQHSfkSOlWZA_1739372742
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dc32f753dso2734609f8f.3
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 07:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739372741; x=1739977541;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xpi6XrIfU8ynTSLJgJioMjgRVH8BsjQhrh5/KYMHUFM=;
 b=k4Gxm2RhwzPYy5Km6iSk3h1kyIXwdfJ68W7zMw0wdPHFbSqeUN6+O3KOx79zHHIIRX
 cStXR7yhVoitmQLYe3N/Ean5s3ntsYFA+cPeTNcIQbHCria1CyTzluysvsmPaMzN7xm7
 dj0DZvyH+g1/Saq/goIft2gJG9S0VFycbYfq6ou/qnK0pPUSpJmg0ofSQLmhEanO3eiy
 q3Be2pGx4E6P7n+AaQjt8PwQNLQ3WrQooT/CYDABjOOB0KyAMPKhN7LZCm08v92Njf5w
 qZ5OHvpcYGuEtAkRKyrMCHWiINOigQHGSgXkMEK+aQ71Al8wYPunS6zs1UZLlLEAhN9U
 jpTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa0OCwU3T2qn4PumaDhHo/rE86AbGeeSDi87xB7cKgVs+MWAzRMAMtCo0+OZZigffKS4wI6yNZTb0=@nongnu.org
X-Gm-Message-State: AOJu0YxqSn18HQ5+xy4Hfbsf1dTGBEhneGoVyjAqAjaWHqEv/whGZS1G
 gxXl2kvxiKcMtYBIEuSaqOFPknl4Zh9Dy7ultZwWNOHl3Kpr2wzZy/xZaH0e2i46qg8b1Qg2tFM
 Db+E+DzuTTuk1B1zhuHJjqR/LeArbfzecdB5X0qUdLqBwIo10t4X1423L/fY+Rw==
X-Gm-Gg: ASbGncu5vXShuwbRNb+PKh21+zRflG1ySBmqjTBaU3m5mzcg5kXSpi/8wdVeIjLBpjy
 14Sg9kN4IgVl5HOjvNK78OlXZggd0H73gSPE8ivNapASO1yIyBQ8R5nZZKWTDmC89HWxih8UoG5
 3ZTeTNJZYhwSC8uFvsvlkIuL5gVK2Cd4/8Xo23JeXE6H5wdIFTaxOXls21+h3yrZpU066wucKZg
 VAGMRAyvQ70OBx4smDXpAD/a5vIaZBQd2AL1b6IWVPLQiW/a6jgwKPa2NMKgnfwNPeiaxT58ZCx
 Nb5rFD0=
X-Received: by 2002:a5d:6da8:0:b0:38f:218c:f672 with SMTP id
 ffacd0b85a97d-38f218cf7a2mr1462368f8f.41.1739372739707; 
 Wed, 12 Feb 2025 07:05:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuWWlsEZEoil/AL/o+My1MPVWx2Jc7QwyVqdBJfRmFpOXfZnuaCPKNRzazVXhw//TNKatyIA==
X-Received: by 2002:a5d:6da8:0:b0:38f:218c:f672 with SMTP id
 ffacd0b85a97d-38f218cf7a2mr1462152f8f.41.1739372737749; 
 Wed, 12 Feb 2025 07:05:37 -0800 (PST)
Received: from [192.168.10.81] ([151.95.148.6])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38dd07fa80csm13569946f8f.13.2025.02.12.07.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 07:05:36 -0800 (PST)
Message-ID: <f515a321-8f76-4d94-97d5-309fba14aa85@redhat.com>
Date: Wed, 12 Feb 2025 16:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] rust/block: Add read support for block drivers
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, manos.pitsidianakis@linaro.org, qemu-devel@nongnu.org, 
 qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-10-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250211214328.640374-10-kwolf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ztluwcH2h61HSl6yi3u-7S5jnNbr11L-LlyAuW17HSg_1739372742
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
X-List-Received-Date: Wed, 12 Feb 2025 15:05:47 -0000

On 2/11/25 22:43, Kevin Wolf wrote:
> +/// A request to a block driver
> +pub enum Request {
> +    Read { offset: u64, len: u64 },
> +}
> +

Maybe add flags already?
> +#[allow(dead_code)]
> +pub enum MappingTarget {
> +    /// The described blocks are unallocated. Reading from them yields zeros.
> +    Unmapped,
> +
> +    /// The described blocks are stored in a child node.
> +    Data {
> +        /// Child node in which the data is stored
> +        node: (),

Make it already a *mut BlockDriverState, or *mut BdrvChild?  Or are you worried of
irritating the borrow checker? :)

> +        /// Offset in the child node at which the data is stored
> +        offset: u64,
> +    },
> +}
> +
> +/// A mapping for a number of contiguous guest blocks
> +pub struct Mapping {
> +    /// Offset of the mapped blocks from the perspective of the guest
> +    pub offset: u64,
> +    /// Length of the mapping in bytes
> +    pub len: u64,
> +    /// Where the data for the described blocks is stored
> +    pub target: MappingTarget,
> +}
> +
>   /// A trait for writing block drivers.
>   ///
>   /// Types that implement this trait can be registered as QEMU block drivers using the
> @@ -37,6 +72,11 @@ unsafe fn open(
>   
>       /// Returns the size of the image in bytes
>       fn size(&self) -> u64;
> +
> +    /// Returns the mapping for the first part of `req`. If the returned mapping is shorter than
> +    /// the request, the function can be called again with a shortened request to get the mapping
> +    /// for the remaining part.
> +    async fn map(&self, req: &Request) -> io::Result<Mapping>;

I am not sure I like the idea of making this the only way to do a read.
Maybe you can keep preadv_part in the trait, and add an utility function
like:

async fn bdrv_co_preadv_with_mappings<F: Future<Output = io::Result<()>>>(
     mut offset: u64,
     mut bytes: u64,
     // IIRC qiov is not changed, but perhaps you still want to require &mut
     // for it to _write_ memory?
     qiov: &mut bindings::QEMUIOVector,
     mut qiov_offset: usize,
     flags: bindings::BdrvRequestFlags,
     mut f: impl FnMut(Request) -> F) -> io::Result<()> {
     while bytes > 0 {
         let req = Request::Read { offset, len: bytes, flags };
         let mapping = f(req).await?;
         ...
     }
     Ok(())
}

Then you can implement BochsImage's trait methods as:

async fn preadv_part(
     &self,
     offset: u64,
     bytes: u64,
     qiov: &mut bindings::QEMUIOVector,
     qiov_offset: usize,
     flags: bindings::BdrvRequestFlags,
) -> io::Result<()> {
     bdrv_co_preadv_with_mappings(offset, bytes, qiov, qiov_offset, flags,
                                  |req| self.map(req)).await
}

BochsImage::map() is a private function and the outer bdrv_co_preadv_part()
only handles qemu_co_run_future() and converting the io::Result.

Paolo


